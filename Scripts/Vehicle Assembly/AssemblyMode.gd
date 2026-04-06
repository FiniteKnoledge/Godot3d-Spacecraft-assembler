extends Camera3D

@onready var camera_3d: Camera3D = $"."

@export var camspeed:float
@onready var doohickey: CheckButton = $"../UI elements/PanelContainer/VBoxContainer/doohickey"
@onready var debug: MeshInstance3D = $"../Cursor"
@onready var AAAHHH: Node3D = $".."
@onready var part_name_label: Label = $"../UI elements/PanelContainer/VBoxContainer/SelectedPart/Part Name"
@onready var vehicle_root: RigidBody3D = $"../Vehicle/Vehicle Root"

@onready var placement_preview: MeshInstance3D = $"../PlacementPreview"

@export var Parts:Array = ["res://PlacableParts/StructuralBlock2M.tscn","res://PlacableParts/Thruster1.tscn"]
# (0,StructuralBlock2M)(1,BumbleBee)
@export var SelectedPart:int

func _process(delta: float) -> void:
	#scrolling through parts
	if Input.is_action_just_pressed("ui_text_scroll_up"):
		if SelectedPart < Parts.size()-1:
			SelectedPart+=1
		else:
			SelectedPart = 0
			
	
	#movement, pretty easy to understand
	if !doohickey.button_pressed:
		if Input.is_action_pressed("PitchDown"):
			camera_3d.position-=camera_3d.global_basis.z*delta*camspeed
		if Input.is_action_pressed("PitchUp"):
			camera_3d.position+=camera_3d.global_basis.z*delta*camspeed
		if Input.is_action_pressed("YawLeft"):
			camera_3d.position-=camera_3d.global_basis.x*delta*camspeed
		if Input.is_action_pressed("YawRight"):
			camera_3d.position+=camera_3d.global_basis.x*delta*camspeed
		if Input.is_action_pressed("ThrottleUp"):
			camera_3d.position+=camera_3d.global_basis.y*delta*camspeed
		if Input.is_action_pressed("ThrottleDown"):
			camera_3d.position-=camera_3d.global_basis.y*delta*camspeed
		
		if Input.is_action_pressed("RollE"):
			camera_3d.rotation.y-=1*delta
		if Input.is_action_pressed("RollQ"):
			camera_3d.rotation.y+=1*delta
	#building
	
func _physics_process(delta: float) -> void:
	part_name_label.text = str(Parts[SelectedPart])
	#making a raycast to find what you lookin at
	var mouse_pos = get_viewport().get_mouse_position()
	var from = camera_3d.project_ray_origin(mouse_pos)
	var to = from + camera_3d.project_ray_normal(mouse_pos) * 1000
	
	var space_state = get_world_3d().direct_space_state
	var result = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(from, to))
	
	if result:
		print(result.get_typed_key_class_name())
		debug.position = result.position
		if result.collider is RigidBody3D:
			#Preview
			placement_preview.show()
			placement_preview.position = result.collider.position+result.normal*2
			placement_preview.rotation = result.collider.rotation
			if Input.is_action_just_pressed("click"): #On click
				#Create the Part
				var NewPartScene = load(Parts[SelectedPart])
				var NewPartReady = NewPartScene.instantiate()
				NewPartReady.position = result.collider.position+result.normal*2
				NewPartReady.rotation = result.collider.rotation
				get_node("../Vehicle").add_child(NewPartReady) #Add it as a child of 
				create_joint(vehicle_root,NewPartReady,result.position)
		else:
			placement_preview.hide()
	
func create_joint(body_a: RigidBody3D, body_b: RigidBody3D, joint_position: Vector3):
	var joint = Generic6DOFJoint3D.new()
	add_child(joint)
	joint.global_position = joint_position
	
	#joint.set_param_z(joint.PARAM_LINEAR_SOFTNESS, 0.1)
	
	joint.node_a = body_a.get_path()
	joint.node_b = body_b.get_path()
	#joint.
	
	
	
	

extends Camera3D

const FOLLOW_SPEED = 14.0

@onready var space_craft:= get_tree()

@onready var physics: RigidBody3D = $"../Physics"

@onready var camera_3d: Camera3D = $"."

@onready var follow_target: Node3D = $"../Physics/Cockpit?/FollowTarget"


@onready var target: MeshInstance3D = $"../Physics/Cockpit?"

@onready var planet: CSGSphere3D = $"../../Enviroment/Planet"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	look_at(planet.global_position)
	camera_3d.position = camera_3d.position.lerp(follow_target.global_position, delta * FOLLOW_SPEED)
	
	if Input.is_action_just_pressed("ui_text_scroll_down"):
		camera_3d.fov-=2
	if Input.is_action_just_pressed("ui_text_scroll_up"):
		camera_3d.fov+=2

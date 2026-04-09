extends Generic6DOFJoint3D
@export var break_distance: float = 10

func _physics_process(_delta):
	var body_a = get_node(node_a) as RigidBody3D
	var body_b = get_node(node_b) as RigidBody3D
	
	if body_a and body_b:
		#print("ah")
		var distance = body_a.position.distance_to(body_b.position)
		
		if distance > break_distance:
			queue_free()

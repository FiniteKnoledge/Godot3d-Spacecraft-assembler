extends RigidBody3D
@onready var thruster_1: RigidBody3D = $"."
@onready var cpu_particles_3d: CPUParticles3D = $MeshInstance3D/CPUParticles3D

@export var inputString:String = "ui_page_up"

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(inputString):
		cpu_particles_3d.emitting = true
		thruster_1.apply_force(thruster_1.global_basis.y*100000*delta)
	else:
		cpu_particles_3d.emitting = false

extends Node3D

@onready var world: Node3D = $".."
@onready var vehicle_root: RigidBody3D = $"../Vehicle/Vehicle Root"


func _process(_delta: float) -> void:
	position=vehicle_root.global_position
	pass

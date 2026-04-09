extends Node3D

@onready var world: Node3D = $".."
@onready var vehicle_root: RigidBody3D = $"../Vehicle/Vehicle Root"
@onready var doohickey: CheckButton = $"../UI elements/PanelContainer/VBoxContainer/doohickey"
@onready var play_mode_camera: Node3D = $"."


func _process(_delta: float) -> void:
	position=vehicle_root.global_position
	
	if doohickey.button_pressed:
		if Input.is_action_pressed("ui_left"):
			play_mode_camera.rotation.y-=1*_delta
		if Input.is_action_pressed("ui_right"):
			play_mode_camera.rotation.y+=1*_delta

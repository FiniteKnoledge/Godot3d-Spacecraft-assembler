extends Node3D

@onready var orbital_camera: Node3D = $PlayModeCamera/Camera3D

@onready var assembler_camera_3d: Camera3D = $AssemblyModeCamera3D

@export var assemblercamtoggle:bool

@onready var doohickey: CheckButton = $"UI elements/PanelContainer/VBoxContainer/doohickey"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if doohickey.button_pressed:
		orbital_camera.current=true
		assembler_camera_3d.current=false
	else:
		orbital_camera.current=false
		assembler_camera_3d.current=true
	
	if assemblercamtoggle == true:
		pass
	else:
		pass

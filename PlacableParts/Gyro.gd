extends RigidBody3D

@onready var gyro_block: RigidBody3D = $"."

@export var gyrospeed:float = 50000

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("PitchDown"):
		gyro_block.apply_torque(gyro_block.basis.x*delta*-gyrospeed)
	if Input.is_action_pressed("PitchUp"):
		gyro_block.apply_torque(gyro_block.basis.x*delta*gyrospeed)
	if Input.is_action_pressed("YawLeft"):
		gyro_block.apply_torque(gyro_block.basis.z*delta*-gyrospeed)
	if Input.is_action_pressed("YawRight"):
		gyro_block.apply_torque(gyro_block.basis.z*delta*gyrospeed)
	if Input.is_action_pressed("RollE"):
		gyro_block.apply_torque(gyro_block.basis.y*delta*-gyrospeed)
	if Input.is_action_pressed("RollQ"):
		gyro_block.apply_torque(gyro_block.basis.y*delta*gyrospeed)

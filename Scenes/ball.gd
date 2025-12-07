class_name Ball extends RigidBody3D

@export var wind_force = 10.0

func _physics_process(_delta: float) -> void:
	apply_force(Vector3(0,0,wind_force))

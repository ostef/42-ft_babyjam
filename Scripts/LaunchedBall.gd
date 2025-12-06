extends RigidBody3D

var body: RigidBody3D
@export var wind_force = 10.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	apply_force(Vector3(0,0,wind_force))
	pass

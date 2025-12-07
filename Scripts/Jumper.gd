extends Node

@onready var body = $RigidBody3D
@export var jump_force = 200.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jumper"):
		body.apply_torque_impulse(body.basis.x * -jump_force)

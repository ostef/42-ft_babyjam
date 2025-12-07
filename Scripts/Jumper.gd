class_name Jumper extends Node

@onready var body = $RigidBody3D
@onready var timer = $Timer
@export var jump_force = 200.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jumper") and timer.is_stopped():
		body.apply_torque_impulse(body.basis.x * -jump_force)
		timer.start()

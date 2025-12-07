extends Node3D

@onready var animation_player = $AnimationPlayer
@onready var around = $zone

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jumper"):
		animation_player.play("JumperLaunch")
		for body in around.get_overlapping_bodies():
			if body is RigidBody3D:
				var direction = global_transform.basis.z
				direction.y = 0
				direction = direction.normalized()
				body.apply_central_impulse(direction * 5)

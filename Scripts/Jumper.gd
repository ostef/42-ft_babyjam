extends Node3D

@onready var animation_player = $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jumper"):
		animation_player.play("JumperLaunch")

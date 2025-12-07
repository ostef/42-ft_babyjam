extends Node

@onready var animation_player = $AnimationPlayer
# Min value before the ball is placed on the spring
@export var spring_load_min = 0.8
@export var spring_load_speed = 1
var spring_load: float
@export var ball_blocker: StaticBody3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("spring"):
		animation_player.play("SpringLoad", -1, 0)

	if Input.is_action_pressed("spring"):
		spring_load += spring_load_speed * delta
		spring_load = clamp(spring_load, 0, 1)
		animation_player.seek(spring_load)
		
		if spring_load >= spring_load_min:
			ball_blocker.set_collision_layer_value(1, false)

	if Input.is_action_just_released("spring"):
		print("Launch! ", spring_load)

		ball_blocker.set_collision_layer_value(1, true)

		animation_player.play("SpringRelease")
		spring_load = 0

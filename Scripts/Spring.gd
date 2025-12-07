extends Node3D

@onready var animation_player = $AnimationPlayer
# Min value before the ball is placed on the spring
@export var spring_load_min = 0.8
@export var spring_load_speed = 1
var spring_load: float
@export var ball_scene: PackedScene
@export var ball_spawn_point: Node3D
var current_ball: RigidBody3D
@export var push_force = 20.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("spring"):
		animation_player.play("SpringLoad", -1, 0)

	if Input.is_action_pressed("spring"):
		spring_load += spring_load_speed * delta
		spring_load = clamp(spring_load, 0, 1)
		animation_player.seek(spring_load)
		
		if !current_ball && spring_load >= spring_load_min:
			current_ball = ball_scene.instantiate()
			ball_spawn_point.add_child(current_ball)

	if Input.is_action_just_released("spring"):
		if current_ball:
			current_ball.set_linear_velocity(basis.y * push_force * spring_load)
			current_ball = null
		
		animation_player.play("SpringRelease")
		spring_load = 0

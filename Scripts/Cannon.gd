extends Node3D

@onready var explosion = $Stand/Canon/ExplosionLight
@onready var muzzle = $MuzzleFlash_1
@onready var animation_player = $AnimationPlayer
@onready var around = $around
@onready var cooldown = $Cooldown
var is_on_cooldown: bool = false

@export var action_name: String
@export var ball_scene: PackedScene
@export var launch_point: Node3D
@export var launch_velocity = 10.0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_name) and not is_on_cooldown:
		trigger_cooldown()
		if not is_ball_around():
			var inst = ball_scene.instantiate()
			get_parent_node_3d().add_child(inst)
			inst.global_position = launch_point.global_position
			inst.global_rotation = launch_point.global_rotation
			inst.set_linear_velocity(-transform.basis.z * launch_velocity)
		else :
			apply_force_around()
		
		muzzle.muzzle_flash()
		explosion.explosion()
		animation_player.play("CannonShoot")

func trigger_cooldown():
	is_on_cooldown = true
	cooldown.start()

func is_ball_around():
	for body in around.get_overlapping_bodies():
		if body is Ball:
			return true
	return false

func apply_force_around():
	for body in around.get_overlapping_bodies():
		if body is Ball:
			var direction = -global_transform.basis.z
			direction.y = 0
			direction = direction.normalized()
			body.linear_velocity = direction * 20

func _on_cooldown_timeout() -> void:
	is_on_cooldown = false

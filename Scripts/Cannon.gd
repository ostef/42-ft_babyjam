extends Node3D

@export var cooldown_bar_position: Vector3 = Vector3(10, -50, 0)
@onready var progress_bar = $cooldown_bar
@onready var explosion = $Stand/Canon/ExplosionLight
@onready var muzzle = $MuzzleFlash_1
@onready var animation_player = $AnimationPlayer
@export var cooldown_time: float = 3.0
var current_time: float = 0.0
var is_on_cooldown: bool = false

@export var action_name: String
@export var ball_scene: PackedScene
@export var launch_point: Node3D
@export var launch_velocity = 10.0

func _ready():
	#reset_state()
	cooldown_positionning()

func cooldown_positionning():
	var active_camera = get_viewport().get_camera_3d()
	var screen_pos = active_camera.unproject_position(self.global_position + cooldown_bar_position)
	progress_bar.position = screen_pos - (progress_bar.size / 2)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(action_name) and not is_on_cooldown:
		trigger_cooldown()
		var inst = ball_scene.instantiate()
		get_parent_node_3d().add_child(inst)
		inst.global_position = launch_point.global_position
		inst.global_rotation = launch_point.global_rotation
		inst.set_linear_velocity(-transform.basis.z * launch_velocity)
		
		muzzle.muzzle_flash()
		explosion.explosion()
		animation_player.play("CannonShoot")

	handle_cooldown(delta)

func handle_cooldown(delta):
	if is_on_cooldown:
		update_cooldown(delta)

func trigger_cooldown():
	is_on_cooldown = true
	current_time = cooldown_time
	progress_bar.value = 0

func update_cooldown(delta):
	current_time -= delta

	if current_time <= 0:
		is_on_cooldown = false
		reset_state()
	else:
		var ratio = 1.0 - (current_time / cooldown_time)
		progress_bar.value = ratio * 100

func reset_state():
	progress_bar.value = 100.0

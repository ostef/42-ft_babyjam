extends Node3D

@export var action_name: String
@export var ball_scene: PackedScene
@export var launch_point: Node3D
@export var launch_velocity = 10.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(action_name):
		var inst = ball_scene.instantiate()
		get_parent_node_3d().add_child(inst)
		inst.global_position = launch_point.global_position
		inst.global_rotation = launch_point.global_rotation
		inst.set_linear_velocity(transform.basis.y * launch_velocity)

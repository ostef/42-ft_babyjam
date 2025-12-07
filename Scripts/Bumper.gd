class_name Bumper extends Node3D

@export var power = 10
@export var score = 10

func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		var normal = (body.global_position - global_position)
		normal.y = 0;
		normal = normal.normalized()
		body.set_linear_velocity(normal * power)
		if body is Ball:
			Scoring.add_score(score)

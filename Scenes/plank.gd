class_name plank extends Area3D

@export var power = 10
@export var score = 20

func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		var direction = global_transform.basis.z
		direction.y = 0
		direction = direction.normalized()
		body.linear_velocity = direction * power
		if body is Ball:
			Scoring.add_score(score)

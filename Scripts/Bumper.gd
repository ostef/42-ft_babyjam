class_name Bumper extends Node3D

func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		var normal = (body.global_position - global_position)
		normal.y = 0;
		normal = normal.normalized()
		body.set_linear_velocity(normal * 100)

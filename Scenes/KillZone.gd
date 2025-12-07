extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body is Ball:
		body.queue_free()
		if GameManager.ball_in_stock == 0 and GameManager.ball_in_level == 0:
			GameManager.end_game()

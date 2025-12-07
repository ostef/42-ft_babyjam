extends StaticBody3D


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Ball:
		Scoring.add_mult(1)
		Scoring.add_score(250)

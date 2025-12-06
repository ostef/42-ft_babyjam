extends Node

func _on_body_exited_world_bounds(body: Node3D):
	body.queue_free()

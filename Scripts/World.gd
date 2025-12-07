extends Node

@export var wind_force = 5.0
@onready var world_bounds = $WorldBounds
@onready var wind_area = $WindArea

func _physics_process(_delta: float) -> void:
	var bodies = wind_area.get_overlapping_bodies()
	for body in bodies:
		if body is RigidBody3D:
			body.apply_force(Vector3(0, 0, wind_force))

func _on_body_exited_world_bounds(body: Node3D):
	if body is RigidBody3D:
		body.queue_free()

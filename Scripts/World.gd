extends Node

@export var wind_force = 10.0
@onready var world_bounds = $WorldBounds

func _physics_process(delta: float) -> void:
	var bodies = world_bounds.get_overlapping_bodies()
	for body in bodies:
		if body is RigidBody3D and body != self:
			body.apply_force(Vector3(0,0,wind_force))

func _on_body_exited_world_bounds(body: Node3D):
	if body is RigidBody3D:
		body.queue_free()

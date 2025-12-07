extends RigidBody3D

@export var explosion_force = 15.0
@onready var explosion_radius = $ExplosionRadius

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("explosion"):
		explode()

func explode():
	var bodies = explosion_radius.get_overlapping_bodies()
	for body in bodies:
		if body is Ball and body != self:
			apply_explosion_force(body)
	queue_free()

func apply_explosion_force(body: RigidBody3D):
	var direction = body.global_position - global_position
	var push_vector = direction.normalized() * explosion_force
	body.apply_central_impulse(push_vector)

func _on_body_entered(body: Node) -> void:
	if body is RigidBody3D || body is Bumper:
		explode()

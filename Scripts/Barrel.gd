extends RigidBody3D

@export var wind_force = 10.0
@export var explosion_force = 15.0
@onready var explosion_radius = $ExplosionRadius

func _physics_process(_delta: float) -> void:
	apply_force(Vector3(0,0,wind_force))

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

extends Node3D

@export_group("Déplacement")
@export var move_speed: float = 2.0
@export var direction: Vector3 = Vector3(1, 0, 0)

@export_group("Flottement")
@export var float_height: float = 0.5
@export var float_speed: float = 2.0

# Cette variable est publique pour être modifiée par le Spawner
var initial_y: float = 0.0
var time_passed: float = 0.0

func _ready():
	# On capture la position de départ par défaut
	initial_y = position.y

func _process(delta):
	time_passed += delta

	# 1. Avancer
	global_position += direction.normalized() * move_speed * delta

	# 2. Flotter (Par rapport à initial_y)
	var new_y = initial_y + sin(time_passed * float_speed) * float_height
	position.y = new_y

	# 3. Tangage (Optionnel)
	rotation.z = sin(time_passed * float_speed * 0.5) * 0.2
	rotation.x = cos(time_passed * float_speed * 0.3) * 0.2

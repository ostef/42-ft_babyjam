extends Area3D

@export var object_to_spawn: PackedScene
@export var height_offset: float = -2.0 

# --- NOUVEAUX REGLAGES ---
@export var min_time: float = 10.0
@export var max_time: float = 20.0

@onready var spawn_col = $CollisionShape3D
@onready var timer = $Timer

func _ready():
	# On connecte le signal
	timer.timeout.connect(spawn_object)
	
	# On lance le premier cycle immédiatement
	start_random_timer()

func start_random_timer():
	# On choisit un temps au hasard entre 5 et 20
	var random_wait = randf_range(min_time, max_time)
	
	# On lance (ou relance) le timer avec ce temps précis
	timer.start(random_wait)

func spawn_object():
	# --- 1. INSTANCIATION (Code précédent) ---
	if object_to_spawn and spawn_col:
		var radius_x = 0.0
		var radius_z = 0.0
		var shape = spawn_col.shape
		
		if shape is BoxShape3D:
			radius_x = shape.size.x / 2
			radius_z = shape.size.z / 2
		elif shape is SphereShape3D or shape is CylinderShape3D:
			radius_x = shape.radius
			radius_z = shape.radius
		else:
			radius_x = 1.0
			radius_z = 1.0

		# Prise en compte de l'échelle (Scale)
		radius_x *= spawn_col.scale.x
		radius_z *= spawn_col.scale.z
		
		var random_x = randf_range(-radius_x, radius_x)
		var random_z = randf_range(-radius_z, radius_z)
		
		var instance = object_to_spawn.instantiate()
		get_tree().current_scene.add_child(instance)
		
		var spawn_pos = global_position + Vector3(random_x, height_offset, random_z)
		instance.global_position = spawn_pos
		
		if "initial_y" in instance:
			instance.initial_y = spawn_pos.y
		
		instance.rotation.y = randf_range(0, TAU)
	
	# --- 2. RELANCE DU TIMER ---
	# Une fois l'objet apparu, on relance le dé pour la prochaine fois
	start_random_timer()

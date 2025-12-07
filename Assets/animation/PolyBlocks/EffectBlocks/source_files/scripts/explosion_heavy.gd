#explosion_heavy
@tool
extends Node3D

@export var auto_animate: bool = false
@export var cooldown: float = 2.0
var animation_time: float = 0.0

@onready var fire: GPUParticles3D = $Fire
@onready var sparks: GPUParticles3D = $Sparks
@onready var smoke: GPUParticles3D = $Smoke
@onready var debri: GPUParticles3D = $Debri



func explosion() -> void:
	fire.restart()
	sparks.restart()
	smoke.restart()
	debri.restart()
	var max_lifetime = max(fire.lifetime, sparks.lifetime, smoke.lifetime, debri.lifetime)
	if not Engine.is_editor_hint():
		await get_tree().create_timer(max_lifetime).timeout
		queue_free()

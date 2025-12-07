extends Label

func _ready():
	text_animation()
	pivot_offset = size / 2
	GameManager.game_over.connect(start)

func text_animation():
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func start():
	visible = true

func _process(delta: float) -> void:
	if visible == true:
		if Input.is_action_just_pressed("enter"):
			GameManager.reset()

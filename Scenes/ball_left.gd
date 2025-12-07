extends Label

func _ready() -> void:
	GameManager.ball_change.connect(update_text)
	self.text = "%s / 3" % GameManager.ball_in_stock
	
func update_text():
	self.text = "%s / 3" % GameManager.ball_in_stock

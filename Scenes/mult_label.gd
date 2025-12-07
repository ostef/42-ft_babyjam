extends Label

func _ready() -> void:
	Scoring.mult_update.connect(update_score)
	self.text = "%s" % Scoring.mult
	
func update_score(_amount: int):
	self.text = "%s" % Scoring.mult

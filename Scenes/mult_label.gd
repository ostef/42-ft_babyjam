extends Label

func _ready() -> void:
	Scoring.mult_update.connect(update_score)
	self.text = "Mult: %s" % Scoring.mult
	
func update_score(_amount: int):
	self.text = "Mult: %s" % Scoring.mult

extends Label

func _ready() -> void:
	Scoring.best_score_update.connect(update)
	self.text = "Best Score: %s" % Scoring.best_score
	
func update(_amount: int):
	self.text = "Best Score: %s" % Scoring.best_score

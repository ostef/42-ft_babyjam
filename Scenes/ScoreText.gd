extends Label

func _ready() -> void:
	Scoring.score_update.connect(update_score)
	self.text = "Score: %s" % Scoring.score
	
func update_score(_amount: int):
	self.text = "Score: %s" % Scoring.score

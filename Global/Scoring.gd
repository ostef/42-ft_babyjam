extends Node

var score : int = 0
var best_score : int = 0
var mult : float = 1.0

func add_score(amount: int):
	var modified_amount = int(amount * mult)
	score += modified_amount
	score_update.emit(modified_amount)

func add_mult(amount: int):
	mult += amount
	mult_update.emit(amount)
	
func set_best_score(new_best: int):
	if best_score < new_best:
		best_score_update.emit(new_best - best_score)
		best_score = new_best

func reset_score():
	score = 0
	score_update.emit(0)
	
func reset_mult():
	mult = 1
	mult_update.emit(0)

signal score_update(amount: int);
signal mult_update(amount: int);
signal best_score_update(amount: int);

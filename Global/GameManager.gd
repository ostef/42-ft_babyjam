extends Node

enum State {
	PLAYING,
	GAME_OVER,
}

var ball_in_level := 0
var ball_in_stock := 3
var state : State = State.PLAYING

func remove_ball():
	ball_in_stock -= 1
	ball_change.emit()

func end_game():
	Scoring.set_best_score(Scoring.score)
	game_over.emit()
	Scoring.reset_mult()
	Scoring.reset_score()

func reset():
	ball_in_level = 0
	ball_in_stock = 3
	ball_change.emit()

signal game_over;
signal ball_change;

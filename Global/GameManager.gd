extends Node

enum State {
	PLAYING,
	GAME_OVER,
}

var ball_in_level := -1
var ball_in_stock := 3
var state : State = State.PLAYING

func remove_ball():
	ball_in_stock -= 1
	ball_change.emit()

func end_game():
	game_over.emit()
	Scoring.set_best_score(Scoring.score)
	Scoring.reset_mult()
	Scoring.reset_score()

func reset():
	ball_in_level = 0
	ball_in_stock = 3

signal game_over;
signal ball_change;

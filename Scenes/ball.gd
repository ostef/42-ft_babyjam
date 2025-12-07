class_name Ball extends RigidBody3D

func _ready():
	GameManager.ball_in_level += 1;

func _exit_tree():
	GameManager.ball_in_level -= 1;

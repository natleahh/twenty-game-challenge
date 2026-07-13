class_name ScoreBoard extends Control

@export var player_1_score: Label
@export var player_2_score: Label

func update_score(update: Dictionary[int, int]) -> void:
	player_1_score.text = str(update[1])
	player_2_score.text = str(update[2])

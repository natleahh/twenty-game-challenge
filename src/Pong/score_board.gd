extends Control

@onready var player_1: Label = $Player1
@onready var player_2: Label = $Player2

func update_score(update: Dictionary[ScoreZone.Player, int]) -> void:
	player_1.text = str(update[ScoreZone.Player.PLAYER_ONE])
	player_2.text = str(update[ScoreZone.Player.PLAYER_TWO])

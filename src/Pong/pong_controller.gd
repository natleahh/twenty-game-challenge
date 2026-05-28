class_name PongPlayerController extends Node

@export var player_1_direction: float
@export var player_2_direction: float

func _process(_delta: float) -> void:
	player_1_direction = Input.get_axis("player_1_down", "player_1_up")
	player_2_direction = Input.get_axis("player_2_down", "player_2_up")

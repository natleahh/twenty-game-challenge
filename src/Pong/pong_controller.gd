class_name PongPlayerController extends Node

@export var direction: float

func _process(_delta: float) -> void:
	direction = Input.get_axis("player_1_down", "player_1_up")

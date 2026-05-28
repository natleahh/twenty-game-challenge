extends Node2D

@onready var pong_ball: PongBall = $PongBall
@onready var pong_controller: PongPlayerController = $PongPlayerController

@onready var player_1: Paddle = $Player1
@onready var player_2: Paddle = $Player2


func _ready() -> void:
	pong_ball.serve()

func _process(_delta: float) -> void:
	handle_player_movement()


func handle_player_movement() -> void:
	player_1.direction = pong_controller.player_1_direction
	player_2.direction = pong_controller.player_2_direction

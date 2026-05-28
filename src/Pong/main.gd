extends Node2D

@onready var pong_ball: PongBall = $PongBall
@onready var pong_controller: PongPlayerController = $PongPlayerController
@onready var score_board: Control = $CanvasLayer/ScoreBoard

@onready var player_1: Paddle = $Player1
@onready var player_2: Paddle = $Player2

var score: Dictionary[ScoreZone.Player, int] = {
	ScoreZone.Player.PLAYER_ONE: 0,
	ScoreZone.Player.PLAYER_TWO: 0
}

func _ready() -> void:
	pong_ball.serve()

func _process(_delta: float) -> void:
	handle_player_movement()


func handle_player_movement() -> void:
	player_1.direction = pong_controller.player_1_direction
	player_2.direction = pong_controller.player_2_direction

func _on_score_zone_point(winner: ScoreZone.Player) -> void:
	pong_ball.serve()
	score[winner] += 1
	score_board.update_score(score)

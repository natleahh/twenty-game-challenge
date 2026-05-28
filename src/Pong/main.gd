extends Node2D

@onready var pong_ball: PongBall = $PongBall
@onready var pong_controller: PongPlayerController = $PongPlayerController
@onready var paddle: Paddle = $Paddle

var serve_range: float = 0.2

func _ready() -> void:
	handle_ball_serve()

func _process(_delta: float) -> void:
	handle_player_movement()

func get_serve_vector() -> Vector2:
	var initial_arc: Vector2 = Vector2.from_angle(
		randf_range(-PI * serve_range, PI * serve_range)
	)

	if randi() % 2:
		return initial_arc
	else:
		return initial_arc * Vector2(-1, 1)

func handle_ball_serve() -> void:
	pong_ball.velocity = get_serve_vector()

func handle_player_movement() -> void:
	paddle.direction = pong_controller.direction

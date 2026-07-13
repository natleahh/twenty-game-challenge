extends Node2D

const BALL: PackedScene = preload("res://src/Pong/ball/main.tscn")

@export var pong_player_controller: PongPlayerController
@export var player_1: Paddle
@export var player_2: Paddle

@export var ceiling: StaticBody2D
@export var walls: StaticBody2D

@export var score_board: ScoreBoard

var score: Dictionary[int, int] = {
	1: 0,
	2: 0	
}

func _ready() -> void:
	serve_ball()

func _process(_delta: float) -> void:
	handle_player_movement()

func handle_player_movement() -> void:
	player_1.direction = pong_player_controller.player_1_direction
	player_2.direction = pong_player_controller.player_2_direction

func _on_ball_collision(body: Node, ball: RigidBody2D) -> void:
	match body:
		walls:
			ball.queue_free()
			serve_ball()
			update_score(2 if ball.position.x < 0 else 1, 1)
		Paddle:
			ball.apply_central_impulse(ball.linear_velocity.bounce(Vector2.UP))
			
func serve_ball() -> void:
	# new ball 
	var ball: RigidBody2D  = BALL.instantiate()

	# connect collision events
	var _u: int = ball.body_entered.connect(_on_ball_collision.bind(ball))
	ball.linear_velocity = Vector2.from_angle(randf() * 2 * PI) * 300
	
	# add to scene
	call_deferred("add_child", ball)

func update_score(winner: int, update: int) -> void:
	score[winner] += update
	score_board.update_score(score)

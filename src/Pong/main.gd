extends Node2D

@onready var ball: Area2D = $Ball

var serve_range = 0.2

func get_serve_vector() -> Vector2:
	var initial_arc = Vector2.from_angle(
		randf_range(-PI * serve_range, PI * serve_range)
	)
	
	if randi() % 2:
		return initial_arc
	else:
		return initial_arc * Vector2(-1, 1)
	
func _ready() -> void:
	ball.velocity = get_serve_vector()

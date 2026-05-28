class_name PongBall extends Area2D

@export var speed: FloatDoubler

var velocity: Vector2
var serve_range: float = 0.2


func _process(delta: float) -> void:
	position += velocity * delta * speed.value
	
func bounce(normal: Vector2) -> void:
	velocity = velocity.bounce(normal)

func serve() -> void:
	position = get_viewport_rect().get_center()
	velocity = get_serve_vector()

func get_serve_vector() -> Vector2:
	var initial_arc: Vector2 = Vector2.from_angle(
		randf_range(-PI * serve_range, PI * serve_range)
	)
	if randi() % 2:
		return initial_arc
	else:
		return initial_arc * Vector2(-1, 1)

func _on_body_entered(body: CollisionObject2D) -> void:
	if body.collision_layer == 2:	
		bounce(Vector2.RIGHT)
	else:
		bounce(Vector2.UP)

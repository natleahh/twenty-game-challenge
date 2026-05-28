class_name PongBall extends Area2D

@export var speed: FloatDoubler

var velocity: Vector2

func _process(delta: float) -> void:
	position += velocity * delta * speed.value
	
func bounce(normal: Vector2) -> void:
	velocity = velocity.bounce(normal)

func _on_body_entered(body: CollisionObject2D) -> void:
	if body.collision_layer == 2:	
		bounce(Vector2.RIGHT)
	else:
		bounce(Vector2.UP)

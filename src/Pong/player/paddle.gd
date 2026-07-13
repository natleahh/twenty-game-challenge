class_name Paddle extends CharacterBody2D

@export var direction: float = 0
@export var speed: FloatDoubler

func _process(delta: float) -> void:
	velocity = Vector2.UP * direction * delta * speed.value
	var _u: int = move_and_slide()

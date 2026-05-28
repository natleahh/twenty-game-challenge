class_name ScoreZone extends Area2D

enum Player {PLAYER_ONE, PLAYER_TWO}

signal point(winner: Player)

@onready var middle: float = get_viewport_rect().get_center().x 

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	var winner = Player.PLAYER_ONE if area.position.x > middle else Player.PLAYER_TWO
	point.emit(winner)
	

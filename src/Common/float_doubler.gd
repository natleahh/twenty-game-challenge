extends Resource 
class_name FloatDoubler

@export_range(-20, 20, 1) var big: float = 0
@export_range(-1, 1) var small: float = 1

@export var value: float:
	get:
		return small * (2 ** big)

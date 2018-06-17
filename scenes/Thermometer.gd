tool
extends Sprite

var is_ready = false
var min_height = 4
export(float) var min_value = 0.0 setget set_min_value
export(float) var max_value = 100.0 setget set_max_value
export(float) var current_value = 1.0 setget set_current_value
export(int) var height = 10 setget set_height


func _ready():
	is_ready = true


func set_min_value(value):
	min_value = value
	update()


func set_max_value(value):
	max_value = value
	update()


func set_current_value(value):
	current_value = value
	update()


func set_height(value):
	height = value
	update()


func _draw():
	var value = clamp(current_value, min_value, max_value)
	$Bar.scale.y = -height * (value - min_value) / (max_value - min_value)
	$Sides.scale.y = -max(0, height - min_height)
	$Top.position.y = $Sides.scale.y - 1

extends Node2D


const RADIUS = 15

var color = Color(1, 0, 0)


func _draw():
	draw_circle(Vector2(), RADIUS, color)

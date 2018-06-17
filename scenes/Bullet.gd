extends Node2D

const SPEED = 25

onready var explosion_scene = preload("res://scenes/Explosion.tscn")

var direction


func _ready():
	direction = Vector2(0, 1).rotated(rotation)


func _physics_process(delta):
	position -= direction * SPEED * delta


func _on_Bullet_area_entered(area):
	var explosion = explosion_scene.instance()
	explosion.global_position = area.global_position
	explosion.set_as_toplevel(true)
	get_parent().add_child(explosion)
	queue_free()

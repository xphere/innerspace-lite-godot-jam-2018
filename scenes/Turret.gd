extends Node2D

onready var bullet_scene = preload("res://scenes/Bullet.tscn")

var recharging = false


func _ready():
	$Timer.connect('timeout', self, 'finished_recharging')


func fire():
	if recharging:
		return

	recharging = true
	$Timer.start()

	var bullet = bullet_scene.instance()
	bullet.position = global_position
	bullet.rotation = global_rotation
	bullet.set_as_toplevel(true)
	add_child(bullet)


func finished_recharging():
	recharging = false

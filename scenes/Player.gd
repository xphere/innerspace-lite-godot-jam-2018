extends Node2D

const ROTATION_SPEED = 3
const MAX_ROTATION_SPEED = 5
const ROTATION_FRICTION = 0.5
const DAMAGE_MULTIPLIER_FOR_SHIELD = 0.5
const DAMAGE_MULTIPLIER_FOR_PLAYER = 2
const TEMPERATURE_MULTIPLIER_FOR_SHIELD = 0.5
const TEMPERATURE_MULTIPLIER_FOR_PLAYER = 1.5

onready var explosion_scene = preload("res://scenes/Explosion.tscn")

var rotation_intent = 0
var rotation_velocity = 0


func _input(delta):
	rotation_intent = int(Input.is_action_pressed("rotate_right")) - int(Input.is_action_pressed("rotate_left"))


func _physics_process(delta):
	rotation_velocity += rotation_intent * delta * ROTATION_SPEED
	rotation_velocity = clamp(rotation_velocity, -MAX_ROTATION_SPEED, MAX_ROTATION_SPEED)
	if rotation_intent == 0:
		rotation_velocity -= rotation_velocity * ROTATION_FRICTION * delta

	rotation_degrees += rotation_velocity

	if Input.is_action_pressed("fire"):
		$Turret.fire()


func _on_Player_area_entered(area):
	var enemy = area.get_parent()
	$Temperature.hit(enemy.temperature * TEMPERATURE_MULTIPLIER_FOR_PLAYER)
	$Health.hit(abs(enemy.temperature * DAMAGE_MULTIPLIER_FOR_PLAYER))


func _on_Shield_area_entered(area):
	var enemy = area.get_parent()
	$Temperature.hit(enemy.temperature * TEMPERATURE_MULTIPLIER_FOR_SHIELD)
	$Health.hit(abs(enemy.temperature * DAMAGE_MULTIPLIER_FOR_SHIELD))


func _on_died():
	self.set_physics_process(false)
	$Sprite.queue_free()
	$Player.queue_free()
	$LifeDrain.queue_free()
	$"Left Shield".queue_free()
	$"Right Shield".queue_free()
	add_explosion(global_position)
	add_explosion($"Left Shield".global_position)
	add_explosion($"Right Shield".global_position)


func add_explosion(position):
	var explosion = explosion_scene.instance()
	explosion.global_position = position
	explosion.set_as_toplevel(true)
	get_parent().add_child(explosion)

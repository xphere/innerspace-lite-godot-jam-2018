extends Node2D

const ROTATION_SPEED = 3
const MAX_ROTATION_SPEED = 5
const ROTATION_FRICTION = 0.8

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
	$Temperature.hit(1)
	$Health.hit(1)


func _on_Shield_area_entered(area):
	$Temperature.hit(.5)

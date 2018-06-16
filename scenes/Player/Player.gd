extends Node2D

const RADIUS = 10
const SPEED = 15
const MAX_SPEED = 350
const FRICTION = 2.0

var speed = Vector2()
var color = Color(0, 0, 1)

func _draw():
	self.draw_circle(Vector2(), RADIUS, color)


func _physics_process(delta):
	var input_x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if input_x == 0:
		speed -= (speed * FRICTION * delta)
	speed.x = clamp(speed.x + SPEED * input_x, -MAX_SPEED, MAX_SPEED)
	position += speed * delta
	limit_to_camera()


func limit_to_camera():
	var limit_x = get_parent().get_viewport_rect().size.x / 2 - RADIUS

	if position.x < -limit_x:
		speed.x = abs(speed.x)

	if position.x > limit_x:
		speed.x = -abs(speed.x)

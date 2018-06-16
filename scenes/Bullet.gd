extends Node2D

const SPEED = 25

var direction


func _ready():
	direction = Vector2(0, 1).rotated(rotation)


func _physics_process(delta):
	advance(delta)


func advance(delta):
	position -= direction * SPEED * delta


func _on_VisibilityNotifier_screen_exited():
	queue_free()

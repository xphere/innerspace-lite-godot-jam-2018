extends Node2D

const SPEED = 25


func _physics_process(delta):
	advance(delta)


func advance(delta):
	position -= Vector2(0, 1).rotated(rotation) * SPEED * delta


func _on_VisibilityNotifier_screen_exited():
	queue_free()

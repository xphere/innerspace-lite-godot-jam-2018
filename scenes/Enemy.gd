extends Node2D

const ANGULAR_FRICTION = 0.9
const SPEED = 3
const MAX_SPEED = 15

var direction
var speed = 0
var track_node
var initial_direction


func _ready():
	assert(track_node)

	if initial_direction == null:
		initial_direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
	direction = initial_direction.normalized()


func _physics_process(delta):
	var track_direction = (track_node.global_position - global_position).normalized()
	direction = (direction + ANGULAR_FRICTION * delta * (track_direction - direction)).normalized()
	speed = min(speed + SPEED * delta, MAX_SPEED)
	position += direction * speed * delta


func destroy():
	self.set_physics_process(false)
	$Sprite.queue_free()
	$Enemy.queue_free()
	$Tween.interpolate_property(self, 'modulate', modulate, Color(0, 0, 0, 0), 1.0, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()


func _on_Enemy_area_entered(area):
	destroy()


func _on_Tween_tween_completed(object, key):
	queue_free()

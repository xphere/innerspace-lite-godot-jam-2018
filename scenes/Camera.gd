extends Camera2D

const SHAKE_FORCE = 0.4

var shaking = false


func _process(delta):
	if shaking:
		offset = SHAKE_FORCE * Vector2(
			rand_range(-1.0, 1.0),
			rand_range(-1.0, 1.0)
		)
	else:
		offset = Vector2()


func _on_hit(damage, health):
	shaking = true
	yield(get_tree().create_timer(1), 'timeout')
	shaking = false

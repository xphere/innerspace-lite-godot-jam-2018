extends Node2D

const MAX_HEALTH = 100

signal changed(health)
signal died()

var health = 100


func hit(life):
	health = max(0, health - life)
	emit_signal('changed', health)
	if health == 0:
		emit_signal('died')


func bind_to(progressBar):
	progressBar.set_min_value(0)
	progressBar.set_max_value(MAX_HEALTH)
	connect('changed', progressBar, 'set_current_value')

extends Node2D

const MAX_HEALTH = 100

signal changed(health)
signal hit(damage, health)
signal died()

var health = 100


func _ready():
	call_deferred('emit_signal', 'changed', health)


func hit(damage):
	health = max(0, health - damage)
	emit_signal('hit', damage, health)
	set_health(health)


func set_health(health):
	self.health = clamp(health, 0, MAX_HEALTH)
	emit_signal('changed', health)
	if health == 0:
		emit_signal('died')


func bind_to(progressBar):
	progressBar.set_min_value(0)
	progressBar.set_max_value(MAX_HEALTH)
	connect('changed', progressBar, 'set_current_value')

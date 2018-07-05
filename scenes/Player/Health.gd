extends Node2D

const MAX_HEALTH = 100

signal initialized(widget, current_value, min_value, max_value)
signal changed(health)
signal hit(damage, health)
signal died()

var health = 100
var died = false

func _ready():
	call_deferred('emit_signal', 'initialized', self, health, 0, MAX_HEALTH)


func hit(damage):
	health = max(0, health - damage)
	emit_signal('hit', damage, health)
	set_health(health)


func set_health(health):
	if died:
		return
	self.health = clamp(health, 0, MAX_HEALTH)
	emit_signal('changed', self.health)
	if self.health == 0:
		died = true
		emit_signal('died')

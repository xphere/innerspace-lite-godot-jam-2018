extends Timer


const DRAIN_RECOVER = 0.5
const DRAIN_MULTIPLIER = 0.05


var draining = false
var drain_amount = 0


func _process(delta):
	if draining:
		drain_amount *= 1 + DRAIN_MULTIPLIER * delta
	else:
		drain_amount = max(0, drain_amount * (1 - DRAIN_RECOVER * delta))
		if drain_amount == 0:
			set_process(false)


func _on_Temperature_alarm(name, cold):
	if draining:
		return

	draining = true
	drain_amount = 1
	set_process(true)
	start()


func _on_Temperature_end_alarm():
	draining = false
	stop()


func _on_LifeDrain_timeout():
	get_parent().find_node('Health').hit(drain_amount)
	if draining:
		start()

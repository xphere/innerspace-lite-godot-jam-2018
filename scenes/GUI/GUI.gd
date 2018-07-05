extends Control

var try_again = false


func _process(delta):
	if try_again and Input.is_action_just_pressed("fire"):
		get_tree().reload_current_scene()


func _on_Player_died():
	$"Game Over".visible = true
	var score = $Timer.stop()
	$"Again?/Timer".start()


func _on_AgainTimer_timeout():
	$"Again?".visible = true
	try_again = true


func _on_Health_initialized(widget, current_value, min_value, max_value):
	$Health.set_min_value(min_value)
	$Health.set_max_value(max_value)
	$Health.set_current_value(current_value)


func _on_Health_changed(health):
	$Health.set_current_value(health)


func _on_Temperature_initialize(widget, current_value, min_value, max_value):
	$Thermometer.set_min_value(min_value)
	$Thermometer.set_max_value(max_value)
	$Thermometer.set_current_value(current_value)
	$Temperature.bindTo(widget)
	$Temperature.set_current_value(current_value)
	$State.bindTo(widget)


func _on_Temperature_changed(temperature):
	$Thermometer.set_current_value(temperature)

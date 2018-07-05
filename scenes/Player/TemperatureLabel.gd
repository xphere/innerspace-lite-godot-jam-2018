extends Label


func _on_Temperature_changed(temperature):
	text = '%.2fºC' % temperature



func _on_Temperature_alarm(name, cold):
	if cold:
		modulate = Color(0.0, 0.5, 1.0)
	else:
		modulate = Color(1.0, 0.0, 0.0)


func _on_Temperature_end_alarm():
	modulate = Color(1.0, 1.0, 1.0)

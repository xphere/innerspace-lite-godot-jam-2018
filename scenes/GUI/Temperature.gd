extends Label


func bindTo(node):
	node.connect("changed", self, "_on_changed")
	node.connect("alarm", self, "_on_alarm")
	node.connect("end_alarm", self, "_on_end_alarm")


func set_current_value(temperature):
	text = '%.2fºC' % temperature


func _on_changed(temperature):
	set_current_value(temperature)
	

func _on_alarm(name, cold):
	if cold:
		modulate = Color(0.0, 0.5, 1.0)
	else:
		modulate = Color(1.0, 0.0, 0.0)


func _on_end_alarm():
	modulate = Color(1.0, 1.0, 1.0)

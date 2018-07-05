extends Sprite


func _on_Temperature_alarm(name, cold):
	if cold:
		modulate_to(Color(0, 0, 0.5))
	else:
		modulate_to(Color(0.5, 0, 0))


func _on_Temperature_end_alarm():
	modulate_to(Color(0.5, 0.5, 0.5))


func modulate_to(color):
	$Tween.stop_all()
	$Tween.interpolate_property(self, 'modulate', modulate, color, 1.0, Tween.TRANS_SINE, Tween.EASE_IN)
	$Tween.start()

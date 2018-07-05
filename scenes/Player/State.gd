extends Label


func _ready():
	visible = false


func _on_Temperature_alarm(name, cold):
	$AnimationPlayer.play("Blink")
	text = name
	visible = true
	if cold:
		modulate = Color(0.0, 0.5, 1.0)
	else:
		modulate = Color(1.0, 0.0, 0.0)


func _on_Temperature_end_alarm():
	visible = false
	$AnimationPlayer.stop()

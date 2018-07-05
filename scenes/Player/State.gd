extends Label


func _ready():
	visible = false


func bindTo(widget):
	widget.connect("alarm", self, "_on_alarm")
	widget.connect("end_alarm", self, "_on_end_alarm")


func _on_alarm(name, cold):
	$AnimationPlayer.play("Blink")
	text = name
	visible = true
	if cold:
		modulate = Color(0.0, 0.5, 1.0)
	else:
		modulate = Color(1.0, 0.0, 0.0)


func _on_end_alarm():
	visible = false
	$AnimationPlayer.stop()

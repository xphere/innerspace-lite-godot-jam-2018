extends Control

var try_again = false


func _ready():
	$Player/Temperature.bind_to($Thermometer)
	$Player/Health.bind_to($ProgressBar)


func _process(delta):
	if try_again and Input.is_action_just_pressed("fire"):
		get_tree().reload_current_scene()


func _on_Player_died():
	$"Centered Container".visible = true
	var score = $Timer.stop()
	$"Again?/Timer".start()


func _on_repeat_again():
	$"Again?".visible = true
	try_again = true

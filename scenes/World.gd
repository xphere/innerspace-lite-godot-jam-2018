extends Node2D


func _ready():
	$Player/Temperature.bind_to($Thermometer)
	$Player/Health.bind_to($ProgressBar)


func _on_Player_died():
	$"Centered Container".visible = true
	get_tree().paused = true

extends Node2D


func _ready():
	$Player/Temperature.bind_to($Thermometer)

extends Node2D


func _physics_process(delta):
	var motion_intent = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	rotation += motion_intent * delta

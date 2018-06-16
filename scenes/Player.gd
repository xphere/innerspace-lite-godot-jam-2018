extends Node2D


func _physics_process(delta):
	var motion_intent = int(Input.is_action_pressed("rotate_right")) - int(Input.is_action_pressed("rotate_left"))
	rotation += motion_intent * delta

	if Input.is_action_pressed("fire"):
		$Turret.fire()

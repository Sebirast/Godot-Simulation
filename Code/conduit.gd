extends Node2D

func _physics_process(delta):
	var currentAngle = $Sprite.get_rotation_degrees()
	if Input.is_action_pressed("ui_up"):
		pass

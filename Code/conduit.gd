extends Node2D

func _physics_process(delta):
	var currentAngle = $Sprite.get_rotation_degrees()
	print(currentAngle)
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		$Sprite.set_rotation_degrees(currentAngle + 1)
	if Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		$Sprite.set_rotation_degrees(currentAngle -1)
		
	

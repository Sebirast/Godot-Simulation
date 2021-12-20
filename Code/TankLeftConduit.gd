extends Node2D

func _physics_process(delta):
	print($Sprite1.get_rotation_degrees())
	var currentAngle = $Sprite1.get_rotation_degrees()
	if Input.is_action_pressed("LeftConduitUp") and not Input.is_action_pressed("LeftConduitDown"):
		$Sprite1.set_rotation_degrees(currentAngle + 1)
	if Input.is_action_pressed("LeftConduitDown") and not Input.is_action_pressed("LeftConduitUp"):
		$Sprite1.set_rotation_degrees(currentAngle - 1)

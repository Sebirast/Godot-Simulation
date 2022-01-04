extends Node2D

func _physics_process(delta):
	print($conduit.get_rotation_degrees())
	var currentAngle = $conduit.get_rotation_degrees()
	if Input.is_action_pressed("LeftConduitUp") and not Input.is_action_pressed("LeftConduitDown"):
		$conduit.set_rotation_degrees(currentAngle + 1)
	if Input.is_action_pressed("LeftConduitDown") and not Input.is_action_pressed("LeftConduitUp"):
		$conduit.set_rotation_degrees(currentAngle - 1)

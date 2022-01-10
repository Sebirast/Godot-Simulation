extends Node2D

var counter = 0
var hearts = [$HeartFull1, $HeartEmpty1, $HeartFull2, $HeartEmpty2, $HeartFull3, $HeartEmpty3]

func _process(delta):
	if Input.is_action_just_pressed("LeftShoot"):
		$HeartEmpty1.visible = not $HeartEmpty1.visible
		$HeartFull1.visible = not $HeartEmpty1.visible

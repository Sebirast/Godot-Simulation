extends Node2D

var counter = 0

func subtractHeart():

	if(counter == 0):
		$HeartEmpty1.visible = true
		$HeartFull1.visible = not $HeartFull1.visible
		
	elif(counter == 1):
		$HeartEmpty2.visible = true
		$HeartFull2.visible = not $HeartFull2.visible
		
	elif(counter == 2):
		$HeartEmpty3.visible = true
		$HeartFull3.visible = not $HeartFull3.visible
		get_parent().find_node("TextGameover").visible = true
		if(name == "LifeBarLeft"):
			get_parent().find_node("LeftTank").destroyTank()
		
		elif(name == "LifeBarRight"):
			get_parent().find_node("RightTank").destroyTank()
			
	
	counter += 1

func _process(delta):
	pass

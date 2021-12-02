class_name tank
extends KinematicBody2D

var velocity = Vector2(0, 0)

func _physics_process(delta):
	if(Input.get_action_strength("ui_right")):
		velocity.x = 1 *  400
	elif(Input.get_action_strength("ui_left")):
		velocity.x = -1 * 400
	else:
		return
	
	velocity = move_and_slide(velocity)
		

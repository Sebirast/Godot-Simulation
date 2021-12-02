extends RigidBody2D

var velocity = 0

func _physics_process(delta):
	if(Input.get_action_strength("ui_right")):
		velocity = 1
	elif(Input.get_action_strength("ui_left")):
		velocity = -1
	else:
		velocity = 0
	
	velocity = move_local_x(velocity)
		

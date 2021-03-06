class_name Tank
extends RigidBody2D

const WALK_ACCEL = 500.0
const WALK_MAX_VELOCITY = 140.0

func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	var step = state.get_step()
	var on_floor = false
	
	for i in range(state.get_contact_count()):
		var contact_normal = state.get_contact_local_normal(i)
		if contact_normal.dot(Vector2(0, -1)) > 0.5:
			on_floor = true
			print(on_floor)
	
	if on_floor:
		if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
			velocity.x = min( velocity.x + WALK_ACCEL * step, WALK_MAX_VELOCITY )
		elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
			velocity.x = max( velocity.x - WALK_ACCEL * step, -WALK_MAX_VELOCITY )
		else:
			var xspeed = max( abs(velocity.x) - WALK_ACCEL * step, 0)
			velocity.x = xspeed * sign(velocity.x)

			
	
	velocity += state.get_total_gravity() * step
	state.set_linear_velocity(velocity)

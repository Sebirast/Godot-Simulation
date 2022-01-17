class_name Tank
extends Node2D

const WALK_ACCEL = 500.0
const WALK_MAX_VELOCITY = 140.0

var bullet = preload("res://Bullets/bulletBeige.tscn")

func _ready():
	$AnimatedSprite.visible = false
	
func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	var step = state.get_step()
	var on_floor = false
	
	for i in range(state.get_contact_count()):
		var contact_normal = state.get_contact_local_normal(i)
		if contact_normal.dot(Vector2(0, -1)) > 0.5:
			on_floor = true
	
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

func _physics_process(delta):
	var currentAngle = $conduit.get_rotation_degrees()
	if Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		$conduit.set_rotation_degrees(currentAngle - 1)
	elif Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		$conduit.set_rotation_degrees(currentAngle + 1)
	
	if Input.is_action_just_pressed("RightShoot"):
		var bullet_instance = bullet.instance()
		bullet_instance.z_index = -1
		bullet_instance.position = position
		bullet_instance.set_linear_velocity(700*Vector2(cos(deg2rad(180+currentAngle+24.3)), sin(deg2rad(180+currentAngle+24.3))))
		get_parent().add_child(bullet_instance)
		
func destroyTank():
	$conduit.visible = false
	$Tank.visible = false
	$AnimatedSprite.visible = true
	$AnimatedSprite.play()


func _on_AnimatedSprite_animation_finished():
	queue_free()


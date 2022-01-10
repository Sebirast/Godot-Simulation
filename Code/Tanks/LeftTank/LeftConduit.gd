extends Sprite

var bullet = preload("res://Bullets/bulletBeige.tscn")

func _physics_process(delta):
	var currentAngle = get_rotation_degrees()
	if Input.is_action_pressed("LeftConduitDown") and not Input.is_action_pressed("LeftConduitUp"):
		set_rotation_degrees(currentAngle + 1)
	elif Input.is_action_pressed("LeftConduitUp") and not Input.is_action_pressed("LeftConduitDown"):
		set_rotation_degrees(currentAngle - 1)
	
	if Input.is_action_just_pressed("LeftShoot"):
		var bullet_instance = bullet.instance()
		bullet_instance.z_index = -1
#		bullet_instance.global_transform.origin(get_global_transform_with_canvas()[2])
		bullet_instance.position = Vector2(200, 300)
		print(get_global_transform_with_canvas()[2])
		print(bullet_instance.position)
		bullet_instance.set_linear_velocity(Vector2(cos(rad2deg(currentAngle)), sin(deg2rad(currentAngle))))
		add_child(bullet_instance)

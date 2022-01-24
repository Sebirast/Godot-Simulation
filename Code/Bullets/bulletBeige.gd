extends RigidBody2D

var collisionCounter = 0
var oldForce = Vector2(0, 0)

func _ready():
	$AnimatedSprite.visible = false

	
func _on_Bullet_body_entered(body):
	if body.name == "LeftTank" and collisionCounter == 0:
		var lifeBar = get_parent().find_node("LifeBarLeft")
		lifeBar.subtractHeart()
		collisionCounter = 1

	elif body.name == "RightTank" and collisionCounter == 0:
		var lifeBar = get_parent().find_node("LifeBarRight")
		lifeBar.subtractHeart()
		collisionCounter = 1

	$BulletBeigeOutline.visible = false
	$AnimatedSprite.visible = true
	$AnimatedSprite.play()

func _on_AnimatedSprite_animation_finished():
	get_parent().remove_child(self)

func _physics_process(delta):
	var velocity = get_linear_velocity()
	var airResistanceX = -0.4 * 1.155 * (1.2041 / 2) * velocity.x 
	var airResistanceY = -0.4 * 1.155 * (1.2041 / 2) * velocity.y

	var airresistance = Vector2(airResistanceX, airResistanceY)
	print(airresistance)

	add_central_force(-oldForce)
	add_central_force(airresistance)

	oldForce = airresistance
	
	set_global_rotation(atan2(-velocity.x , velocity.y) +  PI);

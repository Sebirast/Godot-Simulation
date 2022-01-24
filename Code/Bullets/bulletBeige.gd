extends RigidBody2D


#https://godotengine.org/qa/38675/how-can-i-lessen-the-x-velocity-while-in-mid-air
var collisionCounter = 0

func _ready():
	$AnimatedSprite.visible = false
	set_rotation_degrees(10000)

	
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
	set_global_rotation(atan2(-velocity.x , velocity.y) +  PI);

func setRotation(rotation):
	set_rotation_degrees(rotation)
	


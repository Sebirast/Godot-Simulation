extends RigidBody2D

var collisionCounter = 0

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
	

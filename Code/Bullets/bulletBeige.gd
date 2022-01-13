extends RigidBody2D

func _ready():
	$AnimatedSprite.visible = false
	
func _on_Bullet_body_entered(body):
	$BulletBeigeOutline.visible = false
	$AnimatedSprite.visible = true
	$AnimatedSprite.play()

func _on_AnimatedSprite_animation_finished():
	get_parent().remove_child(self)


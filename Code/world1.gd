extends Node2D

var shootingSpeed

func _ready():
	$TextGameover.visible = false

func reload():
	get_tree().reload_current_scene()


func determineShootingSpeed():
	if (find_node("ArtillerieModeCheckBox").pressed) and not find_node("BattleModeCheckBox").pressed:
		shootingSpeed = 700
	elif not (find_node("ArtillerieModeCheckBox").pressed) and find_node("BattleModeCheckBox").pressed:
		shootingSpeed = 500

	print(shootingSpeed)

func _process(delta):
	determineShootingSpeed()

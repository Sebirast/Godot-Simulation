extends Node2D

func _ready():
	$TextGameover.visible = false

func reload():
	get_tree().reload_current_scene()

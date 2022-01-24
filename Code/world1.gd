extends Node2D

func _ready():
	$TextGameover.visible = false

func reload():
	get_tree().reload_current_scene()


func _on_Button2_pressed():
	pass # Replace with function body.

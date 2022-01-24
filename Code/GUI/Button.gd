extends Button

func _ready():
	Color(255, 255, 255)
	
	visible = false
	
func _on_Button_pressed():
	get_parent().find_node("ClickReset").play()
	get_parent().reload()


extends CanvasLayer

func _ready():
	$OptionsMenu.connect("back_pressed", self, "on_back_pressed")
	
	
func on_back_pressed():
	$"/root/ScreenTransitionMananger".transition_to_scene("res://scenes/UI/MainMenu.tscn")

extends CanvasLayer

onready var continueButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ContinueButton

func _ready():
	continueButton.connect("pressed", self, "on_continue_pressed")
	
func on_continue_pressed():
	$"/root/ScreenTransitionMananger".transition_to_scene("res://scenes/UI/MainMenu.tscn")



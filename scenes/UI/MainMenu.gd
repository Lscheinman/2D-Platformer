extends CanvasLayer

onready var PlayButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PLAYButton
onready var OptionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OPTIONSButton
onready var QuitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QUITButton


func _ready():
	PlayButton.connect("pressed", self, "on_play_pressed")
	QuitButton.connect("pressed", self, "on_quit_pressed")
	OptionsButton.connect("pressed", self, "on_options_pressed")
	
func on_play_pressed():
	$"/root/LevelManager".change_level(0)
	
func on_quit_pressed():
	get_tree().quit()

func on_options_pressed():
	$"/root/ScreenTransitionMananger".transition_to_scene("res://scenes/UI/OptionsMenuStandlone.tscn")
	

extends CanvasLayer

signal back_pressed

onready var BackButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var WindowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowModeButton

var fullscreen = false

func _ready():
	WindowModeButton.connect("pressed", self, "on_window_mode_pressed")
	BackButton.connect("pressed", self, "on_back_pressed")
	update_display()
	
	
func on_window_mode_pressed():
	fullscreen = !fullscreen
	OS.window_fullscreen = fullscreen
	update_display()
	
func update_display():
	WindowModeButton.text = "WINDOWED" if !fullscreen else "FULLSCREEN"
	

func on_back_pressed():
	emit_signal("back_pressed")
	

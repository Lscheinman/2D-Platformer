extends CanvasLayer

signal back_pressed

onready var BackButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var WindowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowModeButton
onready var musicRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/MusicVolumeContainer/RangeControl
onready var sfxRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/SFXVolumeContaine/RangeControl

var fullscreen = false

func _ready():
	WindowModeButton.connect("pressed", self, "on_window_mode_pressed")
	musicRangeControl.connect("percentage_changed", self, "on_music_volume_changed")
	sfxRangeControl.connect("percentage_changed", self, "on_sfx_volume_changed")
	BackButton.connect("pressed", self, "on_back_pressed")
	update_display()
	update_initial_volume_settings()
	
	
func on_window_mode_pressed():
	fullscreen = !fullscreen
	OS.window_fullscreen = fullscreen
	update_display()
	
func update_display():
	WindowModeButton.text = "WINDOWED" if !fullscreen else "FULLSCREEN"
	
func update_bus_volume(busName, volumePercent):
	var busIdx = AudioServer.get_bus_index(busName)
	var volume_Db = linear2db(volumePercent)
	AudioServer.set_bus_volume_db(busIdx, volume_Db)
	
func get_bus_volume_percent(busName):
	var BusIdx = AudioServer.get_bus_index(busName)
	var volumePercent = db2linear(AudioServer.get_bus_volume_db(BusIdx))
	return volumePercent

func update_initial_volume_settings():
	var musicPercent = get_bus_volume_percent("Music")
	var sfxPercent = get_bus_volume_percent("SFX")
	musicRangeControl.set_current_percentage(musicPercent)
	

func on_back_pressed():
	emit_signal("back_pressed")
	

func on_music_volume_changed(percent):
	update_bus_volume("Music", percent)
	
func on_sfx_volume_changed(percent):
	update_bus_volume("SFX", percent)




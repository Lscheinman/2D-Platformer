extends Node

var ScreenTransitionScene = preload("res://scenes/UI/Screentransition.tscn")


func transition_to_scene(scenePath):
	var ScreenTransition = ScreenTransitionScene.instance()
	add_child(ScreenTransition)
	yield(ScreenTransition, "screen_covered")
	get_tree().change_scene(scenePath)

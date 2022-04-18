extends Node

var ScreenTransitionScene = preload("res://scenes/UI/Screentransition.tscn")


func transition_to_scene(scenePath):
	for button in get_tree().get_nodes_in_group("animated_button"):
		button.disabled = true
	
	yield(get_tree().create_timer(.2), "timeout")
	var ScreenTransition = ScreenTransitionScene.instance()
	add_child(ScreenTransition)
	yield(ScreenTransition, "screen_covered")
	get_tree().change_scene(scenePath)

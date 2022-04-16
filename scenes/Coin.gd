extends Node2D

func _ready():
	$Area2D.connect("area_entered", self, "on_area_entered")
	
func on_area_entered(area2d):
	$RandomAudioStreamPlayer.play()
	$RandomAudioStreamPlayer2.play()
	$AnimationPlayer.play("pickup")
	call_deferred("disable_pickup")
	
	var base_level = get_tree().get_nodes_in_group("base_level")[0]
	base_level.coin_collected()

func disable_pickup():
	$Area2D/CollisionShape2D.disabled = true

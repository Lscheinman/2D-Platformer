extends Button

export(bool) var disableHoverAnim

func _ready():
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	connect("pressed", self, "on_pressed")
	
func _process(_delta):
	rect_pivot_offset = rect_min_size / 2
	
func on_mouse_entered():
	if (!disableHoverAnim):
		$HoverAnimationPlayer.play("hover")
	
func on_mouse_exited():
	if (!disableHoverAnim):
		$HoverAnimationPlayer.play_backwards("hover")
	
func on_pressed():
	$ClickAnimationPlayer.play("click")
	$AudioStreamPlayer.play()

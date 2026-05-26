extends UIControllerNode


func _ready() -> void:
	var PlayButton: Button = controls.get("button.play")
	var QuitButton: Button = controls.get("button.quit")
	
	PlayButton.pressed.connect(
		func():
			push_warning("TODO: Implement play button.")
	)
	
	QuitButton.pressed.connect(
		func():
			get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
			get_tree().quit()
	)

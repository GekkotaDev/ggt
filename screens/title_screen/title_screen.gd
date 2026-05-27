extends UIControllerNode

func _ready() -> void:
	var play_button: Button = controls.get("button.play")
	var quit_button: Button = controls.get("button.quit")

	play_button.pressed.connect(
		func():
			push_warning("TODO: Implement play button.")
	)

	quit_button.pressed.connect(
		func():
			get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
			get_tree().quit()
	)

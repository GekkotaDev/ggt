extends UIControllerNode

@export var warning_label: Label
@export var message_label: Label


func _ready() -> void:
	warning_label.text = warning_label.text.format(
		{
			"game": ProjectSettings.get("application/config/name"),
		},
	)

	var continue_button: Button = controls.get("button.continue")
	var quit_button: Button = controls.get("button.quit")

	continue_button.pressed.connect(
		func():
			get_tree().paused = false
			AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
			queue_free()
	)

	quit_button.pressed.connect(
		func():
			get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
			get_tree().quit()
	)

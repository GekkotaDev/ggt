extends UIControllerNode

@export var settings: SettingsFile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save_button: Button = controls.get("button.save")
	var cancel_button: Button = controls.get("button.cancel")

	save_button.pressed.connect(
		func():
			queue_free()
	)

	cancel_button.pressed.connect(
		func():
			queue_free()
	)

extends UIControllerNode

@export var store: SettingsStore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save_button: Button = controls.get("button.save")
	var cancel_button: Button = controls.get("button.cancel")
	
	save_button.pressed.connect(
		func():
			store.apply()
			queue_free()
	)
	
	cancel_button.pressed.connect(
		func():
			queue_free()
	)

extends UIControllerNode

@export var file: SettingsFile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save_button: Button = controls.get("button.save")
	var cancel_button: Button = controls.get("button.cancel")

	save_button.pressed.connect(
		func():
			var settings: Array[SettingsSerde] = find_children("*").filter(
				func(node: Node):
					return node is SettingsSerde
			)

			for setting in settings:
				var collection: SettingResource = file["collections"][setting.collection_id]

				if setting is SettingsInput:
					collection[setting.key] = setting.value
				if setting is SettingsOption:
					collection[setting.key] = setting.value
				if setting is SettingsRange:
					collection[setting.key] = setting.value
				if setting is SettingsToggle:
					collection[setting.key] = setting.value

			for collection in file["collections"]:
				collection = collection as SettingResource
				assert(collection.applied() == OK, "Invalid application of settings.")
				collection.emit_changed()

			file.persist()
			# SoundManager.play_ui_sound()
			queue_free()
	)

	cancel_button.pressed.connect(
		func():
			# SoundManager.play_ui_sound()
			queue_free()
	)

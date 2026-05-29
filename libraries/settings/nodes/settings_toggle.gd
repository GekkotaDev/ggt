class_name SettingsToggle
extends SettingsSerde

@export var value: bool
@export var button: BaseButton


func _ready() -> void:
	assert(typeof(value) == TYPE_BOOL)
	super()

	if not button:
		var parent := get_parent()
		assert(parent != null)
		button = parent

	button.toggled.connect(
		func(mode: bool):
			value = mode
	)


func apply() -> Error:
	var collection := file.collections[collection_id]
	collection[key] = value
	return OK


func load() -> Error:
	var collection := file.collections[collection_id]
	value = collection[key]
	button.toggle_mode = value
	return OK

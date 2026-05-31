class_name SettingsOption
extends SettingsSerde

@export var id: String
@export var value: int
@export var button: OptionButton


func _ready() -> void:
	assert(typeof(value) == TYPE_INT)
	super()

	if not button:
		var parent := get_parent()
		assert(parent != null)
		button = parent

	button.item_selected.connect(
		func(new: int):
			value = new
	)


func apply() -> Error:
	var collection := file.collections[collection_id]
	collection[key] = value
	return OK


func load() -> Error:
	var collection := file.collections[collection_id]
	value = collection[key]
	button.selected = value
	return OK

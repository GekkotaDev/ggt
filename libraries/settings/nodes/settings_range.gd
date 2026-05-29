class_name SettingsRange
extends SettingsSerde

@export var value: float
@export var ranger: Slider


func _ready() -> void:
	assert(typeof(value) == TYPE_FLOAT)
	super()

	if not ranger:
		var parent := get_parent()
		assert(parent != null)
		ranger = parent

	ranger.value_changed.connect(
		func(new: float):
			value = new
	)


func apply() -> Error:
	var collection := file.collections[collection_id]
	collection[key] = value
	return OK


func load() -> Error:
	var collection := file.collections[collection_id]
	value = collection[key]
	ranger.value = value
	return OK

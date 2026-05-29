class_name SettingsInput
extends SettingsSerde

@export var label: String
@export var value: int
@export var button: Button
@export var prompt: PackedScene


func _ready() -> void:
	assert(typeof(value) == TYPE_INT)
	super()

	if not button:
		var parent := get_parent()
		assert(parent != null)
		button = parent

	button.pressed.connect(
		func():
			var node: Node = prompt.instantiate()
			if node is InputPrompt:
				handle_prompt(node)
	)


func handle_prompt(prompt: InputPrompt):
	prompt.action = key
	prompt.input_received.connect(
		func(input_name: String):
			label = input_name,
		CONNECT_ONE_SHOT,
	)
	get_tree().root.add_child(prompt)


func apply() -> Error:
	var collection := file.collections[collection_id]
	collection[key] = InputHelper.serialize_inputs_for_action(key)
	return OK


func load() -> Error:
	var collection := file.collections[collection_id]
	InputHelper.deserialize_inputs_for_action(key, collection[key])
	return OK

class_name InputPrompt
extends Control

@export var action: StringName = ""

signal input_received(label: String)


func _ready() -> void:
	if action == "":
		queue_free()


func _unhandled_input(event: InputEvent) -> void:
	if action == "":
		accept_event()
		queue_free()
		return

	if (event is InputEventKey or event is InputEventMouseButton) and event.is_pressed():
		accept_event()
		InputHelper.set_keyboard_input_for_action(action, event)

		if event is InputEventKey:
			input_received.emit(event.key_label)

		if event is InputEventMouseButton:
			input_received.emit(event.as_text())

		queue_free()

	if event is InputEventJoypadButton and event.is_pressed():
		accept_event()
		InputHelper.set_joypad_input_for_action(action, event)

		input_received.emit(event.as_text())

		queue_free()

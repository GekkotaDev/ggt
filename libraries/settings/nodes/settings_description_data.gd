class_name SettingsDescriptionData
extends Node

@export var parent: Control
@export_multiline var description: String = ""

signal selected(description: String)


func _ready() -> void:
	parent = parent if parent else get_parent()

	parent.focus_entered.connect(
		func():
			selected.emit(description)
	)

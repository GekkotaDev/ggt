class_name SettingsDescriptionView
extends Node

@export var label: Label


func _ready() -> void:
	var descriptions: Array[SettingsDescriptionData] = find_children("*").filter(
		func(node: Node):
			return node is SettingsDescriptionData
	)

	for description in descriptions:
		description.selected.connect(
			func(text: String):
				label.text = text
		)

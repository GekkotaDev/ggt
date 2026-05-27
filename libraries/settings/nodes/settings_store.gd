class_name SettingsStore
extends Node

@export var menu: Node
@export var path := "user://settings.dat"

var settings: Dictionary[StringName, Variant] = { }


func _ready() -> void:
	var bytes := FileAccess.get_file_as_bytes("user://settings.dat")
	if bytes.is_empty():
		return
	settings = bytes_to_var(bytes)

	var options := menu.find_children("*", "SettingsSerde")
	for option in options:
		if option is SettingsSerde:
			option.apply()


func apply():
	var options := menu.find_children("*", "SettingsSerde")

	for option in options:
		if option is SettingsSerde:
			option.apply()

	var file := FileAccess.open("user://settings.dat", FileAccess.WRITE)
	file.store_buffer(var_to_bytes(settings))
	file.close()

@abstract
class_name SettingsSerde
extends Node

@export var file: SettingsFile
@export var collection_id: String
@export var key: String


func _ready() -> void:
	self.load()


@abstract func load() -> Error


@abstract func apply() -> Error

extends Control

@export var scene_one: PackedScene

@export_group("Game Data")
@export var settings: SettingsFile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings.hydrate()
	SceneManager.change_scene(scene_one)

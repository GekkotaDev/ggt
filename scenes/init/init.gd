extends Control

@export var first_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneManager.change_scene(first_scene)

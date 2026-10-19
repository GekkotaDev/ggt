extends Node

@export var managers: Dictionary[StringName, SceneManager] = { }


func _init() -> void:
	managers.set(&"global", GlobalSceneManager)

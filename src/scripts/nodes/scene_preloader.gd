class_name ScenePreloader extends Node

@export var manager_key: StringName = &"global"
@export var cache_invalidate: bool
@export var scenes: PackedStringArray


func _init() -> void:
	if cache_invalidate:
		MultiSceneManager.managers[manager_key].queue_remove_scenes()
	MultiSceneManager.managers[manager_key].queue_add_scenes(scenes)

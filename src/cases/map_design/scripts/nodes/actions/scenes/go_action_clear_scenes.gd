@tool
class_name GoActionClearScenes extends GoActionScene

@export_group("Scenic")
@export var manager_key: StringName = &"global"

@export_group("Scene")
@export var exclude_tags: Array[String] = []


func _trigger() -> void:
	MultiSceneManager.managers[manager_key].queue_remove_scenes(exclude_tags)

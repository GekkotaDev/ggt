@tool
class_name GoActionRemoveScenes extends GoActionScene

@export_group("Scenic")
@export var manager_key: StringName = &"global"

@export_group("Scene")
@export var scene_names: Array[StringName] = []


func _trigger() -> void:
	for scene_name in scene_names:
		MultiSceneManager.managers[manager_key].queue_remove_scene(scene_name)

@tool
class_name GoActionAddScenes extends GoActionScene

@export_group("Scenic")
@export var manager_key: StringName = &"global"

@export_group("Scene")
@export var scene_names: Array[StringName] = []
@export var data: Variant = null


func _trigger() -> void:
	MultiSceneManager.managers[manager_key].queue_add_scenes(scene_names, data)

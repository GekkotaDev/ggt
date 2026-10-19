@tool
class_name GoActionSetScene extends GoActionScene

@export_group("Scenic")
@export var manager_key: StringName = &"global"

@export_group("Scene")
@export var scene_name: StringName = "":
	set(value):
		scene_name = value
		update_configuration_warnings()
@export var data: Variant = null
@export var exclude_tags: Array[String] = []


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: Array[String] = []

	if scene_name.length() <= 0:
		warnings.append("Scene name must not be blank")

	return warnings


func _trigger() -> void:
	if scene_name.length() <= 0:
		Log.error("Scene must be provided.")

	MultiSceneManager.managers[manager_key].queue_set_scene(scene_name, data, exclude_tags)

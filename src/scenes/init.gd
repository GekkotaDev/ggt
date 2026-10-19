extends SceneManager

@export var scripts: Array[GDScript]
@export var target_id: StringName


func _ready() -> void:
	GlobalSceneManager.queue_remove_scenes()
	GlobalSceneManager.queue_set_scene(target_id)
	GlobalSceneManager.apply()

	for script in scripts:
		script.new()

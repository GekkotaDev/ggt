extends SceneManager

@export var debug_script: GDScript
@export var target_id: StringName


func _ready() -> void:
	GlobalSceneManager.queue_remove_scenes()
	GlobalSceneManager.queue_set_scene(target_id)
	GlobalSceneManager.apply()
	debug_script.new()

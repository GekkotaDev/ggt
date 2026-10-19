@tool
class_name GoActionApplyScene extends GoActionScene

@export_group("Scenic")
@export var manager_key: StringName = &"global"

@export_group("Transition")
@export var transition_name: StringName


func _trigger() -> void:
	if transition_name:
		MultiSceneManager.managers[manager_key].with_transition(transition_name)
	MultiSceneManager.managers[manager_key].apply()

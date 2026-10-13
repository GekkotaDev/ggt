class_name BTIsIdle extends BTCondition


func _tick(_delta: float) -> Status:
	var mode: StringName = blackboard.get_var(&"mode")
	return SUCCESS if mode.to_lower() == &"idle" else FAILURE

class_name BTIsPlanning extends BTCondition


func _tick(_delta: float) -> Status:
	var mode: StringName = blackboard.get_var(&"mode")
	return SUCCESS if mode.to_lower() == &"plan" else FAILURE

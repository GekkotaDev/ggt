class_name BTStringVarReducer extends BTAction

@export var key: StringName = ""
@export var reductions: Dictionary[StringName, StringName] = { }


func _tick(_delta: float) -> Status:
	var state: StringName = blackboard.get_var(key)

	if not reductions.has(state):
		return FAILURE

	blackboard.set_var(key, reductions[state])
	return SUCCESS

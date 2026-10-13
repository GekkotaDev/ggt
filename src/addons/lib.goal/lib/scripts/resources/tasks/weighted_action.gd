@abstract
class_name BTWeightedAction extends BTAction

var weight: float = 0.0


@abstract
func action_plan(delta: float) -> Status


@abstract
func action_execute(delta: float) -> Status


func _tick(delta: float) -> Status:
	var mode: StringName = blackboard.get_var(&"mode")

	if mode.to_lower() == &"plan":
		return action_plan(delta)

	if mode.to_lower() == &"execute":
		return action_execute(delta)

	return FAILURE

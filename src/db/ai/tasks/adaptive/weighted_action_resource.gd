class_name BTWeightedActionResource extends BTAction

@export var action: AgentAction

var weight: float:
	get:
		return action.weight


func _tick(delta: float) -> Status:
	var mode: StringName = blackboard.get_var(&"mode")

	if mode.to_lower() == &"plan":
		return action.plan(delta, self)

	if mode.to_lower() == &"execute":
		return action.execute(delta, self)

	return FAILURE

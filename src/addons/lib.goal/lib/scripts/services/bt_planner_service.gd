class_name BTPlannerService


static func is_planning(task: BTTask):
	var mode: String = task.blackboard.top().get_var(&"mode")
	return BTTask.SUCCESS if mode.to_lower() == &"plan" else BTTask.FAILURE


static func is_executing(task: BTTask):
	var mode: String = task.blackboard.top().get_var(&"mode")
	return BTTask.SUCCESS if mode.to_lower() == &"execute" else BTTask.FAILURE


static func is_idle(task: BTTask):
	var mode: String = task.blackboard.top().get_var(&"mode")
	return BTTask.SUCCESS if mode.to_lower() == &"idle" else BTTask.FAILURE


static func select_(task: BTTask) -> float:
	return task.blackboard.get_var(&"weight")


static func set_weight(task: BTTask, value: float) -> float:
	task.blackboard.set_var(&"weight", value)
	return value

class_name BTWeightedDecorator extends BTDecorator

var child: BTTask:
	get:
		return unwrap_decorator(get_child(0))

var weight: float:
	get:
		var task := child
		return task.weight if &"weight" in task else 0


func unwrap_decorator(task: BTTask) -> BTTask:
	if task is BTDecorator:
		return unwrap_decorator(task.get_child(0))
	return task


func _tick(delta: float) -> Status:
	# gdlint-ignore-next-line private-access
	return get_child(0)._tick(delta)

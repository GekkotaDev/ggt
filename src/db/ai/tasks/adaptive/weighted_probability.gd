class_name BTWeightedProbability extends BTProbability

var _tasks: Array[BTTask]:
	get:
		var arr: Array[BTTask] = []

		for index in range(get_child_count()):
			arr.append(get_child(index))

		return arr

var weight: float:
	get:
		var value: float = 0

		for task in _tasks:
			if &"weight" in task and task.weight is float:
				value += task.weight

		return value


func _enter() -> void:
	run_chance = weight


func _exit() -> void:
	run_chance = weight

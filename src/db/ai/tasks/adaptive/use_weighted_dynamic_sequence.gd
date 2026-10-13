class_name BTUseWeightedDynamicSequence extends BTDynamicSequence


func _enter() -> void:
	var tasks: Array[BTTask] = []

	for index in range(get_child_count()):
		tasks.append(get_child(index))

	tasks.sort_custom(
		func(a: BTTask, b: BTTask):
			if &"weight" not in a or &"weight" not in b:
				return false

			var weight_a: float = a.weight
			var weight_b: float = b.weight
			return weight_a > weight_b,
	)

	for index in range(get_child_count()):
		remove_child_at_index(index)

	for task in tasks:
		add_child(task)

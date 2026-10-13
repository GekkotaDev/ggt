class_name BTUseWeightedProbability extends BTComposite

var selected_child: BTTask
var rng = RandomNumberGenerator.new()


func iterize_weights():
	var weights: Array[float] = []

	for index in range(get_child_count()):
		var child := get_child(index)

		if &"weight" in child:
			weights.append(child.weight if child.weight >= 0 else 0)
			continue
		weights.append(0)

	return weights


func select_random_index():
	return rng.rand_weighted(iterize_weights())


func _enter() -> void:
	selected_child = get_child(select_random_index())
	# gdlint-ignore-next-line private-access
	selected_child._enter()


func _tick(delta: float) -> Status:
	# gdlint-ignore-next-line private-access
	return selected_child._tick(delta)


func _exit() -> void:
	# gdlint-ignore-next-line private-access
	selected_child._exit()
	selected_child = null

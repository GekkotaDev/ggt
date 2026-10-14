class_name BTWeightedSuccess extends BTDecorator

@export_group("Weight Parameters")
@export var default_score: float = 0.0
@export var reward_score: float = 1.0
@export var punishment_score: float = -1.0

var weight: float:
	get:
		if status == FAILURE:
			return punishment_score

		if status == SUCCESS:
			return reward_score

		return default_score


func _tick(delta: float) -> Status:
	# gdlint-ignore-next-line private-access
	return get_child(0)._tick(delta)

class_name BTWeightedSuccess extends BTDecorator

@export_group("Weight Parameters")
@export var default_score: float = 0.0
@export var reward_score: float = 1.0
@export var punishment_score: float = -1.0

var weight: float = default_score


func _enter() -> void:
	weight = default_score


func _tick(delta: float) -> Status:
	# gdlint-ignore-next-line private-access
	return get_child(0)._tick(delta)


func _exit() -> void:
	weight = default_score

	if status == FAILURE:
		weight = punishment_score

	if status == SUCCESS:
		weight = reward_score

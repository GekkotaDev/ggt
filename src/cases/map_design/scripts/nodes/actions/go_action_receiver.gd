@tool
class_name GoActionReceiver extends GoAction

@export var tags: Array[String]
@export var actions: Array[GoAction]


func _trigger() -> void:
	for action in actions:
		action.trigger()

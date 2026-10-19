@tool
class_name GoActionRecursiveDispatcher extends GoAction

@export var global: bool = false
@export var scope: Node

@export_group("Filtering")
@export var allowlist: Array[String] = []
@export var denylist: Array[String] = []


func _trigger() -> void:
	var root_node := scope if scope else get_tree().root if global else get_parent()
	var receivers := root_node.find_children("*", "GoActionReceiver") as Array[GoActionReceiver]

	for receiver in receivers:
		if receiver.tags.any(
			func(tag: String):
				return denylist.has(tag),
		):
			continue

		if allowlist.is_empty():
			receiver.trigger()
			continue

		if allowlist.any(
			func(tag: String):
				return receiver.tags.has(tag),
		):
			receiver.trigger()

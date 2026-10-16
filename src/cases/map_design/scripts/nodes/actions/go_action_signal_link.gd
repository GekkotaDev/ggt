## Call the given [GoAction]s when the connected signal has been triggered.
@tool
class_name GoActionSignalLink extends GoAction

@export var action_nodes: Array[GoAction] = []

@export_group("Node")
@export var target_node: Node
@export var target_signal: StringName = &""

@export_group("Options")
@export var connect_flags: Array[ConnectFlags] = []
@export var delay: float = 0.0


func _ready() -> void:
	var signal_ref = target_node.get(target_signal)

	if signal_ref is Signal:
		signal_ref.connect(
			_trigger,
			connect_flags.reduce(
				func(a: int, b: int):
					return a + b,
			),
		)


func _exit_tree() -> void:
	var signal_ref = target_node.get(target_signal)

	if signal_ref is Signal:
		signal_ref.disconnect(_trigger)


func _trigger() -> void:
	started.emit()
	await get_tree().create_timer(delay).timeout
	for action_node in action_nodes:
		action_node.trigger()
	finished.emit()

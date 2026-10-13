@abstract
class_name AgentAction extends Resource

@export var weight: float = 0.0


@abstract
func plan(delta: float, task: BTTask) -> BTTask.Status


@abstract
func execute(delta: float, task: BTTask) -> BTTask.Status

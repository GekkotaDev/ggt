##
class_name ServiceMediator
extends Node

## Error code of the first service to panic.
signal panic(code: Error)

## Services to facilitate.
@export var services: Array[ServiceProcess] = []


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	for service in services:
		service.state_updated.connect(
			func(state: ServiceProcess.ProcessState):
				if state != ServiceProcess.ProcessState.PANICKED:
					return

				panic.emit(service.error or FAILED)
				get_tree().paused = true

				for sibling in services:
					sibling.process_mode = Node.PROCESS_MODE_DISABLED
					sibling.panic_handler()
		)

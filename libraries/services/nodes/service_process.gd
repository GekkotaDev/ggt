##
@abstract
class_name ServiceProcess
extends Node

enum ProcessState {
	## The process has just finished.
	FINISHED,

	## The process is active.
	RUNNING,

	## The process is currently not active.
	## [br]
	## The service will attempt to restart itself when marked as inactive. This is the default
	## state whem not specified in the service's `_ready` method.
	INACTIVE,

	## The proces has encountered an irrecoverable error.
	PANICKED,

	## The process is currently being initialized.
	INITIALIZING,

	## The process has been terminated.
	TERMINATED,
}

enum ProcessType {
	BOOTSTRAP,
	DAEMON,
	EXIT,
	PANIC,
}

signal state_updated(state: ProcessState)

@export var error := OK
@export var state := ProcessState.INACTIVE
@export var type: Array[ProcessType] = []


## Run for every frame.
@abstract func background_process(delta: float) -> ProcessState


## Initialize the process.
## [br]
## Initialization may require may require an arbitrary amount of frames. The developer should take
## great caution not to make it painfully apparent.
@abstract func bootstrap_process() -> ProcessState


## Called when the process sucessfully exits.
## [br]
## This is not called when the game throws a panic.
@abstract func exit_process() -> void


## Called whenever the game panics.
## [br]
## The panic handler will only be called when the game enters a state it cannot recover from. This
## can potentially help avoid softlocking the player.
@abstract func panic_handler() -> Error


## Update the process state in place.
func update_state(value: ProcessState) -> ProcessState:
	state = value
	state_updated.emit(value)
	return value


func _process(delta: float) -> void:
	if state == ProcessState.TERMINATED:
		process_mode = Node.PROCESS_MODE_DISABLED
		state = ProcessState.INACTIVE
		return

	if state == ProcessState.PANICKED:
		if not error:
			error = FAILED
		state = ProcessState.PANICKED
		return

	if state == ProcessState.INACTIVE:
		state = ProcessState.INITIALIZING
		return

	if state == ProcessState.INITIALIZING:
		state = bootstrap_process()
		return

	if state == ProcessState.RUNNING:
		state = background_process(delta)
		return

	if state == ProcessState.FINISHED:
		exit_process()
		state = ProcessState.TERMINATED
		return

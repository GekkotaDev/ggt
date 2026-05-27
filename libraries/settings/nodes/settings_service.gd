class_name SettingsService
extends ServiceProcess

func bootstrap_process() -> ProcessState:
	# TODO: Apply settings to type safe data store.

	return update_state(ProcessState.FINISHED)


func background_process(delta: float) -> ProcessState:
	return update_state(ProcessState.FINISHED)


func exit_process() -> void:
	pass


func panic_handler() -> Error:
	return error

class_name LoaderService
extends ServiceProcess

signal resource(resource: Resource)

@export var path := ""


func bootstrap_process() -> ProcessState:
	return ProcessState.RUNNING


func background_process(_delta: float) -> ProcessState:
	if path == "":
		return update_state(ProcessState.FINISHED)

	var status := ResourceLoader.load_threaded_get_status(path)

	match status:
		ResourceLoader.THREAD_LOAD_FAILED:
			return update_state(ProcessState.TERMINATED)
		ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			error = Error.ERR_FILE_NOT_FOUND
			return update_state(ProcessState.PANICKED)
		ResourceLoader.THREAD_LOAD_LOADED:
			resource.emit(ResourceLoader.load_threaded_get(path))
			path = ""
			return update_state(ProcessState.FINISHED)

	return update_state(ProcessState.RUNNING)


func exit_process() -> void:
	pass


func panic_handler() -> Error:
	return error


## Load a resource within a background thread.
## [br]
## This only merely loads a resource from the provided path in a background thread. The developer
## must handle features such as loading screens.
func load(res: String) -> Signal:
	path = res
	ResourceLoader.load_threaded_request(res)
	state = ProcessState.INITIALIZING
	return resource

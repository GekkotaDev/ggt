class_name PanicService
extends ServiceProcess

const StopScreen := preload("res://screens/panic_screen/panic_screen.tscn")

var logger := PanicLogger.new()


class PanicLog extends Resource:
	var time: String
	var function: String
	var file: String
	var line: int
	var code: String
	var rationale: String
	var type: Error
	var backtraces: Array[ScriptBacktrace]


	func to_panic_screen():
		var error := "{type}: {rationale} @ {time}".format(
			{
				"type": type,
				"rationale": rationale,
				"time": time,
			},
		)

		var location := "\tLocated at file {file}, line {line}, in function {function}".format(
			{
				"file": file,
				"line": line,
				"function": function,
			},
		)

		var trace_messages: Array[String] = []
		for backtrace in backtraces:
			var index := backtrace.get_frame_count()
			var trace_file := backtrace.get_frame_file(index)
			var trace_function := backtrace.get_frame_function(index)
			var trace_line := backtrace.get_frame_line(index)
			var language := backtrace.get_language_name()

			trace_messages.append(
				"{language} script at file {file}, line {line}, in function {function}".format(
					{
						"language": language,
						"file": trace_file,
						"line": trace_line,
						"function": trace_function,
					},
				),
			)

		var panic_report := [
			error,
			location,
			"\t{code}".format({ "code": code }),
			"",
			"Additional context:",
		]
		panic_report.append_array(trace_messages)
		panic_report.append("\n")

		return "\n".join(panic_report)


class PanicLogger extends Logger:
	var errors: Array[PanicLog] = []


	func _log_error(
			function: String,
			file: String,
			line: int,
			code: String,
			rationale: String,
			_editor_notify: bool,
			error_type: ErrorType,
			script_backtraces: Array[ScriptBacktrace],
	) -> void:
		if error_type != 0 or error_type != 2:
			return

		var time := Time.get_time_string_from_system()
		var error_log := PanicLog.new()
		error_log.time = time
		error_log.function = function
		error_log.file = file
		error_log.line = line
		error_log.code = code
		error_log.rationale = rationale
		error_log.backtraces = script_backtraces
		errors.push_back(error_log)


static func panic(
		mediator: ServiceMediator,
		messages: PackedStringArray = [],
		error_code: Error = OK,
) -> Error:
	var service_index := (
			mediator.services.find_custom(func(service): return service is PanicService)
	)
	if service_index < 0:
		return FAILED

	for message in messages:
		push_error(messages)

	var panic_service: PanicService = mediator.services[service_index]
	if error_code:
		panic_service.error = error_code
	panic_service.state = ProcessState.PANICKED
	return OK


func bootstrap_process() -> ProcessState:
	OS.add_logger(logger)
	return update_state(ProcessState.FINISHED)


func background_process(_delta: float) -> ProcessState:
	return update_state(ProcessState.FINISHED)


func exit_process() -> void:
	pass


func panic_handler() -> Error:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)

	var panic_screen := StopScreen.instantiate()
	var scene_tree := get_tree()
	var error_messages: Array[String] = []

	for error_log in logger.errors:
		error_messages.append(error_log.to_panic_screen())

	panic_screen.message_label.text = "\n".join(error_messages)

	scene_tree.root.add_child(panic_screen)

	return error

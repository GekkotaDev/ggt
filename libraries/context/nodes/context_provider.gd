## Provide data to the entire scene tree below it.
## [br]
## The context provider itself does not implement any sort of business logic,
## this task should be handled by additional nodes where a [ContextProvider] is
## used merely as a way of passing around data. This is justified in avoiding
## the creation of ~~spaghetti~~ god objects.
## [br]
## This **won't** eliminate the use of autoloads but rather merely encourages
## avoiding their misuse (e.g: pollutant manager objects)
class_name ContextProvider
extends Node

@export var context: Resource


func _provide_context() -> void:
	propagate_call("use_context", [context])


func _ready() -> void:
	_provide_context()


## Refresh the current context.
## [br]
## All context consumers within the scene tree will be recalled in order to be
## notified that there potentially is an updated value.
func refresh_context() -> void:
	_provide_context()


## Update the current context value.
func update_context(value: Resource) -> void:
	context = value
	_provide_context()

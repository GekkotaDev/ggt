## A reactive resource.
## [br]
@abstract
class_name UIModelResource
extends Resource

var _reactive_properties: PackedStringArray = []

## Mutate state such that it is desynchronized from the reactivity system.
## [br]
## **Using this signal is highly discouraged and is intended as an escape hatch.**
signal desync

## Create side effects in response to state changes.
signal effect(diff: PackedStringArray)

## Execute code in preparation for state changes.
signal prep


## Mark the property as being tracked by the reactivity system.
## [br]
## THis function takes advantage of Godot's getter and setter syntax, and the property name passed
## into this function must also match the variable declaration.
func track(property_name: StringName, default: Variant = null):
	if not _reactive_properties.has(property_name):
		_reactive_properties.append(property_name)

	return default


## Update the state of the resource.
## [br]
## The function is called whenever the resource intends to update any dependent state, and will
## inform them all accordingly. Omitting this call will result in any objects depending on this
## object to not be updated.
func set_state(callable: Callable):
	var diff: PackedStringArray = []
	var stale_map: Dictionary[String, Variant] = { }
	var fresh_map: Dictionary[String, Variant] = { }

	prep.emit()

	for property in _reactive_properties:
		stale_map[property] = get(property)

	desync.emit()
	callable.call(self)

	for property in _reactive_properties:
		fresh_map[property] = get(property)

	for key in fresh_map:
		if stale_map[key] == fresh_map[key]:
			continue

		if not diff.has(key):
			diff.append(key)

	emit_changed()
	effect.emit(diff)

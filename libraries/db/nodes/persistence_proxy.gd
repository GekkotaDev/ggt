## A node placed within a scene tree to convert node properties to primitives
## that can be saved within a resource.
## [br]
## It does not implement any default behaviors. It must be extended in order to
## know what nodes and which of their respective properties should be saved to
## a resource. Two strategies are exposed - the `prepare` method and the `walk` method.
@abstract
class_name PersistenceProxy
extends Node

## A reference to the persisted resource.
@export var resource: PersistedResource

## Nodes that the persistence proxy should start recursively walking down the
## scene tree from.
@export var target: Array[Node] = []


## Called once when the `PersistenceProxy`'s save method is called.
## [br]
## This method can be used alone when you may not want to recursively walk down
## the specified targets (e.g: querying via groups instead). It can also be used
## in conjuction with walking down the targets such as for intialization.
@abstract func prepare() -> Error


## Called for every node specified in `target` and their respective children
## recursively (that is, `target`'s children and it's children and it's children
## and so on and so forth)
## [br]
## If one wishes not to implement a `walk` function, return `Error.ERR_SKIP`
@abstract func walk(node: Node) -> Error


func _walk(nodes: Array[Node] = []):
	if nodes.is_empty():
		var root := get_tree().current_scene.get_children()
		nodes = root if target.is_empty() else target

	for node in nodes:
		if node is PersistenceProxy:
			continue

		_walk(node.get_children())
		var result := walk(node)

		if result != Error.OK:
			return result

	return Error.OK


func save() -> Error:
	var error := prepare()

	if error != Error.OK:
		return error

	return _walk()

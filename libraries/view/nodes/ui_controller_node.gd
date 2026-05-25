## A frontend controller node.
## [br]
## This is to be placed as a child of the root node. It connects your scene tree with the respective
## resource that acts as your data model.
@abstract
class_name UIControllerNode
extends Node

## A mapping of identifiers to respective nodes within the scene tree.
## [br]
## This helps decouple nodes from their respective location within the scene tree by referencing
## them with an immutable identifier instead of a [NodePath].
@export var controls: Dictionary[String, Control] = { }

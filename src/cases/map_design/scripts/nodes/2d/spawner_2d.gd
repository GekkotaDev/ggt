@abstract
class_name Spawner2D extends Marker2D

@export_group("Instantiation Options")
@export var inherit_rotation: bool
@export var offset: Vector2
@export var parent_node: Node


@abstract
func create() -> Node


@abstract
func spawn() -> void

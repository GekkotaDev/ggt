@abstract
class_name Spawner3D extends Marker3D

@export_group("Instantiation Options")
@export var inherit_rotation: bool
@export var offset: Vector3
@export var parent_node: Node


@abstract
func create() -> Node


@abstract
func spawn() -> void

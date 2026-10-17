@abstract
class_name SpawnerTransform3D extends Node

@export var spawner: Spawner3D


@abstract
func transform_node(node: Node3D, offset: Transform3D = Transform3D.IDENTITY) -> Node3D

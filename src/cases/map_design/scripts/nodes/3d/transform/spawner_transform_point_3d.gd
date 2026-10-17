class_name SpawnerTransformPoint3D extends SpawnerTransform3D

@export_group("Point Options")
@export var point: Node3D


func transform_node(node: Node3D, offset: Transform3D = Transform3D.IDENTITY) -> Node3D:
	node.global_transform = point.global_transform

	offset.basis.x += offset.basis.x
	offset.basis.y += offset.basis.y
	offset.basis.z += offset.basis.z

	return node

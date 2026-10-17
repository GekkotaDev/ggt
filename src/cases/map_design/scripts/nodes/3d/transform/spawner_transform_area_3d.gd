class_name SpawnerTransformArea3D extends SpawnerTransform3D

@export_group("Area Options")
@export var point: Node3D
@export var lower_bounds: Vector3
@export var upper_bounds: Vector3


func transform_node(node: Node3D, offset: Transform3D = Transform3D.IDENTITY) -> Node3D:
	node.global_transform = point.global_transform

	node.basis.x += offset.basis.x
	node.basis.y += offset.basis.y
	node.basis.z += offset.basis.z

	node.position.x += randf_range(lower_bounds.x, upper_bounds.x)
	node.position.y += randf_range(lower_bounds.y, upper_bounds.y)
	node.position.z += randf_range(lower_bounds.z, upper_bounds.z)

	return node

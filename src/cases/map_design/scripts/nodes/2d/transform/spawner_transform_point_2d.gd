class_name SpawnerTransformPoint2D extends SpawnerTransform2D

@export_group("Point Options")
@export var point: Node2D


func transform_node(node: Node2D, offset: Transform2D = Transform2D.IDENTITY) -> Node2D:
	node.global_transform = point.global_transform

	node.global_translate(offset.origin)
	node.rotate(offset.get_rotation())
	node.apply_scale(offset.get_scale())
	node.global_skew += offset.get_skew()

	return node

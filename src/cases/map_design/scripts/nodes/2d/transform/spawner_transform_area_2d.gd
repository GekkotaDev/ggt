class_name SpawnerTransformArea2D extends SpawnerTransform2D

@export_group("Area Options")
@export var shape: Shape2D


func transform_node(node: Node2D, offset: Transform2D = Transform2D.IDENTITY) -> Node2D:
	var bounds := shape.get_rect()
	var x := randf_range(bounds.position.x, bounds.position.x + bounds.size.x)
	var y := randf_range(bounds.position.y, bounds.position.y + bounds.size.y)

	node.global_position = Vector2(x, y) + offset.origin

	return node

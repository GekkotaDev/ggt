@tool
class_name SimpleSpawner2D extends Spawner2D

@export var packed_scene: PackedScene


func build() -> Node:
	var node: Node2D = packed_scene.instantiate()

	transform_node.transform_node(node)

	if inherit_rotation:
		node.rotation = rotation

	return node


func spawn() -> void:
	if parent_node:
		parent_node.add_child(build())
		return
	get_tree().current_scene.add_child(build())

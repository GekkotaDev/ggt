@tool
class_name SimpleSpawner3D extends Spawner3D

@export var packed_scene: PackedScene


func build() -> Node:
	var node: Node3D = packed_scene.instantiate()
	var node_rotation := node.rotation

	transform_node.transform_node(node)

	if inherit_rotation:
		node.rotation = node_rotation

	return node


func spawn() -> void:
	if parent_node:
		parent_node.add_child(build())
		return
	get_tree().current_scene.add_child(build())

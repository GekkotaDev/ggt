class_name SimpleSpawner2D extends Spawner2D

@export var packed_scene: PackedScene


func create() -> Node:
	var node: Node2D = packed_scene.instantiate()

	node.global_translate(offset)

	if inherit_rotation:
		node.rotation = rotation

	return node


func spawn() -> void:
	if parent_node:
		parent_node.add_child(create())
		return
	get_tree().current_scene.add_child(create())

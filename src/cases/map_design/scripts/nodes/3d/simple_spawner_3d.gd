class_name SimpleSpawner3D extends Spawner3D

@export var packed_scene: PackedScene


func create() -> Node:
	var node: Node3D = packed_scene.instantiate()

	node.translate(offset)

	if inherit_rotation:
		node.rotation = rotation

	return node


func spawn() -> void:
	if parent_node:
		parent_node.add_child(create())
		return
	get_tree().current_scene.add_child(create())

@tool
class_name RandomizedSpawner2D extends Spawner2D

@export var packed_scenes: Dictionary[String, PackedScene]

var rng := RandomNumberGenerator.new()


func build() -> Node:
	var string_keys: Array[String] = packed_scenes.keys()
	var float_keys: Array[float] = string_keys.map(
		func(key):
			return float(key),
	)
	var index := rng.rand_weighted(float_keys)
	var scene_key := string_keys[index]
	var node: Node2D = packed_scenes[scene_key].instantiate()

	transform_node.transform_node(node)

	if inherit_rotation:
		node.rotation = rotation

	return node


func spawn() -> void:
	if parent_node:
		parent_node.add_child(build())
		return
	get_tree().current_scene.add_child(build())

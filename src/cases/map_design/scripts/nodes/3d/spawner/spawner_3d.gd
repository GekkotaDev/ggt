@abstract
@tool
class_name Spawner3D extends Marker3D

@export_group("Creation")
@export var parent_node: Node
@export var transform_node: SpawnerTransform3D:
	set(value):
		transform_node = value
		update_configuration_warnings()

@export_group("Instance")
@export var inherit_rotation: bool


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: Array[String] = []

	if transform_node == null:
		warnings.append("Spawner2D.transform_node must have instance of SpawnerTransform2D")

	return warnings


@abstract
func build() -> Node


@abstract
func spawn() -> void

@abstract
@tool
class_name Spawner2D extends Marker2D

@export_group("Creation")
@export var parent_node: Node
@export var transform_node: SpawnerTransform2D:
	set(value):
		update_configuration_warnings()

@export_group("Instance")
@export var inherit_rotation: bool


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: Array[String] = []

	if transform_node == null:
		warnings.append("Spawner3D.transform_node must have instance of SpawnerTransform3D")

	return warnings


@abstract
func build() -> Node


@abstract
func spawn() -> void

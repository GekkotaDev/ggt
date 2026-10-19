class_name SparkResourceBinder extends Resource

var _resource: Resource


func _init(resource: Resource) -> void:
	_resource = resource


func bind(state: SparkReactiveBase, resource_key: StringName) -> SparkResourceBinder:
	GlobalSceneManager.SceneManager

	if "peek" not in state:
		return self

	if "value" not in state:
		return self

	_resource.changed.connect(
		func():
			var state_value = state.peek()
			var resource_value = _resource.get(resource_key)

			if resource_value == state_value:
				return

			emit_changed()
			state.value = resource_value,
	)

	return self

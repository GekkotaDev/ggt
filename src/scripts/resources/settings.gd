@tool
class_name GameSettings extends Resource

@export var path: Path


static func _static_init() -> void:
	if Engine.is_editor_hint():
		WCSafeResourceFormatSettings.allow()


static func load(location: Path) -> GameSettings:
	var resource := ResourceLoader.load(location.as_res())
	resource.path = location
	return resource


func save():
	ResourceSaver.save(self, path.to_string())

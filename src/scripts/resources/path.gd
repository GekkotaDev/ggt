class_name Path extends Resource

@export var location: String:
	get:
		return erase_prefixes(location, _prefixes).simplify_path()

static var _prefixes := ["res://", "user://"]


static func erase_prefixes(string: String, prefixes: PackedStringArray) -> String:
	var result := string

	for prefix in prefixes:
		if result.begins_with(prefix):
			result = result.erase(0, prefix.length())

	return result


func _init(path: String) -> void:
	location = erase_prefixes(path, _prefixes)


func as_res() -> String:
	if is_relative():
		return location
	return "res://{path}".format({ path = location })


func as_user() -> String:
	if is_relative():
		return location
	return "user://{path}".format({ path = location })


func is_absolute() -> bool:
	return not is_relative()


func is_relative() -> bool:
	return location.begins_with("./") or location.begins_with("../")


func parent() -> Path:
	var split: Array[String] = location.split("/")
	split.pop_back()
	location = "/".join(split)
	return self


func _to_string() -> String:
	return location

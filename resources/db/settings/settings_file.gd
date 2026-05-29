class_name SettingsFile
extends SaveFile

@export var path: String = "user://settings.dat"


func _init() -> void:
	version = 0
	patch = 0


func hydrate() -> Error:
	var locator := path if path.begins_with("user://") else ("user://" + path)
	var bytes := FileAccess.get_file_as_bytes(locator)
	var file: Dictionary[String, Dictionary] = bytes_to_var(bytes)

	for collection_id in collections:
		var collection := collections[collection_id]
		if collection is SettingResource:
			collection.deserialize(file[collection_id])

	return OK


func persist() -> Error:
	var locator := path if path.begins_with("user://") else ("user://" + path)
	var data: Dictionary[String, Dictionary] = { }

	for collection_id in collections:
		var collection := collections[collection_id]
		if collection is SettingResource:
			data[collection_id] = collection.serialize()
		else:
			return ERR_INVALID_DATA

	var file := FileAccess.open(locator, FileAccess.WRITE)
	file.resize(0)
	file.store_buffer(var_to_bytes(data))
	file.close()
	return OK


func checksum() -> String:
	var hash_sum: int = 0

	for collection in collections.values():
		if collection is SettingResource:
			hash_sum += collection.serialize().hash()

	return str(hash_sum)


func migrate(_storage: SaveFile) -> Error:
	return OK


func downgrade() -> SaveFile:
	return self

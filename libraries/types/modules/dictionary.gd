static func validate(
		dictionary: Dictionary,
		schema: Dictionary[Variant, Callable],
) -> bool:
	for key in schema:
		var result: bool = schema[key].call(dictionary[key])
		if result == false:
			return result
	return true

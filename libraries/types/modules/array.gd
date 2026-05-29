static func to_string_array(array: PackedStringArray) -> Array[String]:
	return Array(
		Array(array),
		TYPE_STRING,
		"",
		null,
	)


static func to_byte_array(array: PackedByteArray) -> Array[int]:
	return Array(
		Array(array),
		TYPE_INT,
		"",
		null,
	)

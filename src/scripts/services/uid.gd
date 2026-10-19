class_name GDUID

static var default_alphabet := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789-_" \
		.split()


static func build_id():
	return IdBuilder.new()


class IdBuilder:
	var alphabet := GDUID.default_alphabet
	var length: int = 64


	func _random_letter() -> String:
		var index := randi_range(0, alphabet.size())
		return alphabet[index]


	func _create(id: String, counter: int) -> String:
		var new_id := "{id}{suffix}".format({ id = id, suffix = _random_letter() })

		if counter > 0:
			return _create(new_id, counter - 1)
		return new_id


	func of_alphabet(value: Array[String]):
		alphabet = value


	func of_length(value: int) -> IdBuilder:
		length = value
		return self


	func create() -> String:
		return _create("", length)

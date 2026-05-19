@tool
extends EditorPlugin

var main_screen_buttons: Array[Node] = []
var labels: Dictionary[String, String] = { }


func _enter_tree() -> void:
	var editor_base_control := EditorInterface.get_base_control()
	var editor_head = editor_base_control.get_child(0).get_child(0)
	var main_screen_container = editor_head.get_child(2)
	main_screen_buttons = main_screen_container.get_children()

	var timer := Timer.new()
	editor_base_control.add_child(timer)

	timer.timeout.connect(
		func():
			main_screen_buttons = main_screen_container.get_children()

			for button in main_screen_buttons:
				var node: Button = button

				if node.text == "":
					continue

				node.tooltip_text = node.text
				labels[node.name] = node.text
				node.text = ""
	)
	timer.one_shot = true
	timer.start(1.0 / 60)

	main_screen_changed.connect(
		func(_0: String):
			main_screen_buttons = main_screen_container.get_children()

			for button in main_screen_buttons:
				var node: Button = button

				if node.text == "":
					continue

				node.tooltip_text = node.text
				labels[node.name] = node.text
				node.text = ""
	)


func _exit_tree() -> void:
	for node in main_screen_buttons:
		node.text = labels[node.name]

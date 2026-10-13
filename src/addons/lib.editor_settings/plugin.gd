@tool
extends EditorPlugin


func _enable_plugin() -> void:
	var editor := EditorInterface.get_editor_settings()

	editor.set_setting("run/auto_save/save_before_running", true)
	editor.set_setting("run/platforms/linuxbsd/prefer_wayland", true)

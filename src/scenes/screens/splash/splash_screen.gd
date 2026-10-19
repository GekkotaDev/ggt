extends Control


func _start(data: Variant):
	pass


func next_scene():
	GlobalSceneManager.queue_set_scene(&"Main Menu")
	GlobalSceneManager.apply()

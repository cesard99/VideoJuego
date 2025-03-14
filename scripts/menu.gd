extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")

func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GUI/option.tscn")

func _on_credits_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()

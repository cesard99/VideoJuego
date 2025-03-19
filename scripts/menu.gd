extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")

func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GUI/results.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GUI/credits.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

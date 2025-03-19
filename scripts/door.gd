extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer
@onready var level_manager: Node = %LevelManager

var level = Global.level

func _on_body_entered(body: Node2D) -> void:
	collision_shape.queue_free()
	timer.start()
	await (timer.timeout)
	load_level_scene(level)
	
func load_level_scene(current_level: int) -> void:
	var scene_path = ""
	Global.mean += level_manager.keys
	
	match current_level:
		1:
			scene_path = "res://scenes/levels/level2.tscn"
		2:
			scene_path = "res://scenes/levels/level3.tscn"
		3:
			scene_path = "res://scenes/levels/level4.tscn"
		4:
			scene_path = "res://scenes/GUI/end.tscn"
	
	Global.level += 1
	# Cambiar a la escena correspondiente
	get_tree().change_scene_to_file(scene_path)

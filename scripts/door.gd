extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	collision_shape.queue_free()
	timer.start()
	await (timer.timeout)
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")

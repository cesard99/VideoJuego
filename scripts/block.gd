extends StaticBody2D

@onready var level_manager: Node = %LevelManager
@onready var timer: Timer = $Timer
@onready var question: Control = $"../../GUI/Question"
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var visited = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if visited == false:
		visited = true
		
		question.block_touched()
		question.visible = true
		timer.start()

		level_manager.add_visited_block()
		animated_sprite.play("disable")

func _on_timer_timeout() -> void:
	get_tree().paused = true 

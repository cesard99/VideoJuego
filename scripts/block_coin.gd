extends StaticBody2D

@onready var level_manager: Node = %LevelManager
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var visited = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if visited == false:
		visited = true
		level_manager.add_point()
		animated_sprite.play("disable")
		audio_stream_player_2d.play()
	
	

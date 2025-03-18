extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process( delta: float) -> void:
	pass


func _on_activation_area_body_entered(body: Node2D) -> void:
	animated_sprite.play("launch")
	body.velocity.y = -1600

	   

extends Node2D

const SPEED = 80
var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_lefts: RayCast2D = $RayCastLefts
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1;
		animated_sprite.flip_h = false
	if ray_cast_lefts.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
		
	position.x += direction * SPEED * delta

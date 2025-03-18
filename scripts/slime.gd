extends Node2D

const SPEED = 80
var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_lefts: RayCast2D = $RayCastLefts
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $Killzone/CollisionShape2D

var health = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1;
		animated_sprite.flip_h = false
	if ray_cast_lefts.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	if health <= 0:
		animated_sprite.play("death")
		collision_shape.disabled = true
		set_physics_process(false)
	
	position.x += direction * SPEED * delta

func _on_get_demage_box_body_entered(body: Node2D) -> void:
	health -= 1
	body.velocity.y = -300;
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "death":
		queue_free()
		

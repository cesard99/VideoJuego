extends CanvasLayer

func _ready():
	get_tree().paused = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		visible = false
		get_tree().paused = false

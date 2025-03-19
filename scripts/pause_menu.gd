extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var v_box_container: VBoxContainer = $VBoxContainer

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		color_rect.visible = not color_rect.visible
		v_box_container.visible = not v_box_container.visible

func _on_salir_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/GUI/menu.tscn")

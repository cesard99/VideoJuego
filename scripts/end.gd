extends Control

@onready var line_edit: LineEdit = $Panel/LineEdit
@onready var mean: Label = $Mean

func _ready():
	mean.text = "Promedio: " + str(Global.mean/4)

func _on_button_pressed() -> void:
	var nombre = line_edit.text.strip_edges()
	var mean = Global.mean/4

	DataManager.save(nombre, mean)  
	get_tree().change_scene_to_file("res://scenes/GUI/menu.tscn")

extends Control

@onready var label: Label = $PanelContainer/MarginContainer/VBoxContainer/label
@onready var option_1: Button = $PanelContainer/MarginContainer/VBoxContainer/option1
@onready var option_2: Button = $PanelContainer/MarginContainer/VBoxContainer/option2
@onready var option_3: Button = $PanelContainer/MarginContainer/VBoxContainer/option3
@onready var option_4: Button = $PanelContainer/MarginContainer/VBoxContainer/option4
@onready var option_5: Button = $PanelContainer/MarginContainer/VBoxContainer/option5
@onready var help: Button = $PanelContainer/MarginContainer/VBoxContainer/GridContainer/Help
@onready var color_rect: ColorRect = $"../ColorRect"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $PanelContainer/MarginContainer/VBoxContainer/GridContainer/AudioStreamPlayer2D
@onready var game_over: CanvasLayer = $"../../GameOver"
@onready var correct: AudioStreamPlayer2D = $Correct
@onready var incorrect: AudioStreamPlayer2D = $Incorrect

@onready var timer: Timer = $Timer
@onready var level_manager: Node = %LevelManager

var level = Global.level

func _process(delta: float) -> void:
	help.disabled = level_manager.score < 20

var questions = [
	# Nivel 1
	[
		{"question": "¿Cuál de los siguientes es un lenguaje de programación?", "options": ["HTML", "Python", "CSS", "JSON", "EcuRed"], "correct_answer": 1},
		{"question": "¿Qué es un objeto en POO?", "options": ["Un tipo de dato primitivo", "Un método de programación", "Un lenguaje de programación", "Una instancia de una clase", "No sé, averigua"], "correct_answer": 3},
		{"question": "¿Qué significa encapsulamiento en POO?", "options": ["Crear múltiples instancias de una clase", "Heredar propiedades de una clase", "Guardar los atributos en el armario para que no los utilicen", "Ejecutar un programa en paralelo", "Ocultar los detalles internos de un objeto"], "correct_answer": 4},
		{"question": "¿Qué es un grafo en matemática discreta?", "options": ["Una función matemática", "Un conjunto de vértices y aristas", "Una secuencia ordenada de números", "Una operación binaria", "Una obra de arte discreta"], "correct_answer": 1},
		{"question": "¿Qué es una proposición en lógica matemática?", "options": ["Una afirmación que puede ser verdadera o falsa", "Un número entero", "Una función matemática", "Una pregunta sin respuesta", "Cásate conmigo"], "correct_answer": 0}
	],
	# Nivel 2
	[
		{"question": "¿Qué es una pila (stack)?", "options": ["Una estructura de datos FIFO (First In, First Out)", "Llave o grifo por donde sale el agua", "Una estructura de datos no lineal", "Una estructura de datos LIFO (Last In, First Out)", "Una estructura de datos basada en árboles"], "correct_answer": 3},
		{"question": "¿Qué es una cola (queue)?", "options": ["Evento que reúne a muchas personas para comprar un producto", "Una estructura de datos FIFO (First In, First Out)", "Una estructura de datos LIFO (Last In, First Out)", "Una estructura de datos no lineal", "Una estructura de datos basada en grafos"], "correct_answer": 1},
		{"question": "¿Qué es la memoria RAM?", "options": ["Un tipo de almacenamiento permanente", "Un tipo de procesador", "Un tipo de almacenamiento temporal", "Un tipo de dispositivo de entrada", "Unidad cerebral utilizada para exponer trabajos de humanidades"], "correct_answer": 2},
		{"question": "¿Qué es la ALU?", "options": ["Unidad Aritmético-Lógica", "Unidad de Memoria", "Amamos La Universidad", "Unidad de Entrada/Salida", "Unidad de Control"], "correct_answer": 0},
		{"question": "¿Qué es una clave primaria?", "options": ["Instrumento musical", "Un campo que no puede ser eliminado", "Un campo que no puede ser modificado", "Un campo que permite valores duplicados", "Un campo que identifica de manera única un registro en una tabla"], "correct_answer": 4}
	],
	# Nivel 3
	[
		{"question": "¿Qué es un requisito funcional?", "options": ["Una restricción sobre el sistema", "Una característica no relacionada con el sistema", "Un requisito de hardware", "Una característica que describe el comportamiento del sistema", "Algo que si funciona, no se toca"], "correct_answer": 3},
		{"question": "¿Qué es un stakeholder?  ", "options": ["Una persona o grupo interesado en el sistema", "Un tipo de requisito", "Un tipo de software", "Un estudiante que monta skate (patineta)", "Un tipo de hardware"], "correct_answer": 0},
		{"question": "¿Qué es el aprendizaje supervisado?", "options": ["Un tipo de aprendizaje donde el modelo se entrena con datos no etiquetados ", "Un tipo de aprendizaje basado en reglas", "Un tipo de aprendizaje basado en grafos", "Aprendizaje bajo vigilancia", "Un tipo de aprendizaje donde el modelo se entrena con datos etiquetados"], "correct_answer": 4},
		{"question": "¿Qué es un requisito no funcional?", "options": ["Una característica que describe el comportamiento del sistema", "Una restricción sobre el sistema", "Una característica no relacionada con el sistema", "Requerimientos para que el sistema no funcione", "Un requisito de hardware"], "correct_answer": 1},
		{"question": "¿Qué es HTML?", "options": ["Un explosivo, me parece", "Un lenguaje de programación", "Un lenguaje de marcado para crear páginas web", "Un lenguaje de estilos", "Un lenguaje de consulta"], "correct_answer": 2}
	],
	# Nivel 4
	[
		{"question": "¿Qué es el método simplex?", "options": ["Un algoritmo para resolver problemas de programación lineal", "Un algoritmo para resolver problemas de redes", "Un algoritmo simple, es obvio", "Un algoritmo para resolver problemas de probabilidad", "Un algoritmo para resolver problemas de lógica"], "correct_answer": 0},
		{"question": "¿Qué es un modelo de transporte?", "options": ["Monta que te quedas", "Un modelo para resolver problemas de probabilidad", "Un modelo para resolver problemas de lógica", "Un modelo para optimizar la distribución de recursos", "Un modelo para resolver problemas de redes"], "correct_answer": 3},
		{"question": "¿Qué es un diagrama de Gantt?", "options": ["Una herramienta para planificar y programar proyectos", "Una herramienta para resolver problemas de optimización", "Una herramienta para resolver problemas de probabilidad", "Diagrama giGantte", "Una herramienta para resolver problemas de lógica"], "correct_answer": 0},
		{"question": "¿Qué es un algoritmo de clustering?", "options": ["Un algoritmo que clasifica datos", "Un algoritmo que predice datos", "Un algoritmo que agrupa datos similares", "Yo no vine a esa clase", "Un algoritmo que elimina datos"], "correct_answer": 2},
		{"question": "¿Qué es un ataque de phishing?", "options": ["Un ataque que modifica datos", "Ataque repartero basado en el engaño", "Un ataque que elimina datos", "Un ataque que bloquea el acceso a un sistema", "Un ataque que intenta obtener información confidencial mediante engaño"], "correct_answer": 4}
	]
]

var current_question_index = -1
var current_level_questions = questions[Global.level-1]
var max_questions_per_level = 5
var used_hints = [] 

func load_next_question():
	if current_question_index < max_questions_per_level - 1:
		var question_data = current_level_questions[current_question_index]
		label.text = question_data.get("question", "Pregunta no encontrada")  # Texto por defecto si falta la clave "question"
		option_1.text = question_data.get("options", [])[0]  # Array vacío por defecto si falta la clave "options"
		option_2.text = question_data.get("options", [])[1]
		option_3.text = question_data.get("options", [])[2]
		option_4.text = question_data.get("options", [])[3]
		option_5.text = question_data.get("options", [])[4]

		var correct_answer_index = question_data.get("correct_answer", -1)  # -1 si falta la clave
		if correct_answer_index != -1:
			print("La respuesta correcta es la opción " + str(correct_answer_index))
		else:
			print("No se ha definido una respuesta correcta para esta pregunta")
	else:
		# Maneja la lógica de fin del juego aquí
		label.text = "¡Fin del juego!"
		option_1.hide()
		option_2.hide()
		option_3.hide()
		option_4.hide()
		option_5.hide()

func block_touched():
	color_rect.visible = true
	current_question_index += 1
	load_next_question()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func check_answer(selected_option, button: Button):
	# Asegurarse de acceder a la pregunta del nivel actual
	var question_data = current_level_questions[current_question_index]
	
	# Comprobar si la opción seleccionada es correcta
	if selected_option == question_data["correct_answer"]:
		correct.play()
		level_manager.add_key()  # Añadir una clave al nivel
		button.self_modulate = Color.GREEN  # Cambiar color del botón a verde si la respuesta es correcta
	else:
		incorrect.play()
		button.self_modulate = Color.RED  # Cambiar color del botón a rojo si la respuesta es incorrecta
	# Reiniciar el temporizador para la siguiente pregunta
	timer.start()

func _on_option_1_pressed() -> void:
	check_answer(0, option_1)
	
func _on_option_2_pressed() -> void:
	check_answer(1, option_2)

func _on_option_3_pressed() -> void:
	check_answer(2, option_3)

func _on_option_4_pressed() -> void:
	check_answer(3, option_4)

func _on_option_5_pressed() -> void:
	check_answer(4, option_5)

func _on_timer_timeout() -> void:
	color_rect.visible = false
	visible = false
	get_tree().paused = false 
	option_1.disabled = false
	option_2.disabled = false
	option_3.disabled = false
	option_4.disabled = false
	option_5.disabled = false
	option_1.self_modulate = Color(1.0, 1.0, 1.0, 1.0) 
	option_2.self_modulate = Color(1.0, 1.0, 1.0, 1.0) 
	option_3.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	option_4.self_modulate = Color(1.0, 1.0, 1.0, 1.0) 
	option_5.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	
	if (level_manager.visisted_block - level_manager.keys) == 3:
		game_over.visible = true
		get_tree().paused = true
	
func _on_help_pressed() -> void:
	if level_manager.score > 20 and used_hints.size() < 3:  # Solo permite hasta 3 pistas
		audio_stream_player_2d.play()
		level_manager.use_point()  # Restar 20 monedas por la pista

		# Obtener opciones incorrectas que aún no han sido marcadas
		var question_data = current_level_questions[current_question_index]
		var incorrect_options = []
		
		for i in range(5):
			if i != question_data["correct_answer"] and i not in used_hints:
				incorrect_options.append(i)
		
		# Si hay opciones incorrectas disponibles, seleccionar una y marcarla en rojo
		if incorrect_options.size() > 0:
			var hint_option = incorrect_options[randi() % incorrect_options.size()]
			used_hints.append(hint_option)  # Registrar la opción usada
			var hint_button = [option_1, option_2, option_3, option_4, option_5][hint_option]
			hint_button.self_modulate = Color.RED
			hint_button.disabled = true  # Desactivar la opción para evitar su selección

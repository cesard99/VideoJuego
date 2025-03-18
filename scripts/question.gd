extends Control

@onready var label: Label = $PanelContainer/MarginContainer/VBoxContainer/label
@onready var option_1: Button = $PanelContainer/MarginContainer/VBoxContainer/option1
@onready var option_2: Button = $PanelContainer/MarginContainer/VBoxContainer/option2
@onready var option_3: Button = $PanelContainer/MarginContainer/VBoxContainer/option3
@onready var option_4: Button = $PanelContainer/MarginContainer/VBoxContainer/option4
@onready var option_5: Button = $PanelContainer/MarginContainer/VBoxContainer/option5
@onready var help: Button = $PanelContainer/MarginContainer/VBoxContainer/GridContainer/Help

@onready var timer: Timer = $Timer
@onready var level_manager: Node = %LevelManager

var level = Global.level

func _process(delta: float) -> void:
	help.disabled = level_manager.score < 20

var questions = [
	# Nivel 1
	[
		{"question": "¿Cuál es la capital de Francia?", "options": ["París", "Londres", "Berlín", "Roma", "Madrid"], "correct_answer": 0},
		{"question": "¿Cuántos planetas hay en el sistema solar?", "options": ["7", "8", "9", "10", "11"], "correct_answer": 1},
		{"question": "¿Quién escribió 'Cien años de soledad'?", "options": ["Gabriel García Márquez", "Pablo Neruda", "Julio Cortázar", "Mario Vargas Llosa", "Carlos Fuentes"], "correct_answer": 0},
		{"question": "¿Cuál es el río más largo del mundo?", "options": ["Amazonas", "Nilo", "Yangtsé", "Mississippi", "Ganges"], "correct_answer": 0},
		{"question": "¿En qué año llegó el hombre a la luna?", "options": ["1969", "1972", "1965", "1963", "1970"], "correct_answer": 0}
	],
	# Nivel 2
	[
		{"question": "¿Qué es la fotosíntesis?", "options": ["Proceso biológico", "Reacción química", "Tecnología moderna", "Reacción física", "Transformación geológica"], "correct_answer": 0},
		{"question": "¿Quién pintó la Mona Lisa?", "options": ["Leonardo da Vinci", "Vincent van Gogh", "Pablo Picasso", "Claude Monet", "Michelangelo"], "correct_answer": 0},
		{"question": "¿Qué gas es más abundante en la atmósfera terrestre?", "options": ["Nitrógeno", "Oxígeno", "Dióxido de carbono", "Argón", "Hidrógeno"], "correct_answer": 0},
		{"question": "¿Cuál es el continente más grande?", "options": ["Asia", "África", "América", "Europa", "Oceanía"], "correct_answer": 0},
		{"question": "¿Quién desarrolló la teoría de la relatividad?", "options": ["Albert Einstein", "Isaac Newton", "Galileo Galilei", "Nikola Tesla", "Max Planck"], "correct_answer": 0}
	],
	# Nivel 3
	[
		{"question": "¿Qué es la gravedad?", "options": ["Fuerza de atracción", "Reacción física", "Movimiento rotacional", "Fuerza de repulsión", "Cálculo geométrico"], "correct_answer": 0},
		{"question": "¿Quién fue el primer presidente de EE. UU.?", "options": ["George Washington", "Thomas Jefferson", "Abraham Lincoln", "Franklin D. Roosevelt", "John Adams"], "correct_answer": 0},
		{"question": "¿En qué país nació el cine?", "options": ["Francia", "Alemania", "EE. UU.", "Italia", "España"], "correct_answer": 0},
		{"question": "¿Quién pintó la 'Última Cena'?", "options": ["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Michelangelo", "Claude Monet"], "correct_answer": 0},
		{"question": "¿Qué océano es el más grande?", "options": ["Pacífico", "Atlántico", "Índico", "Ártico", "Antártico"], "correct_answer": 0}
	],
	# Nivel 4
	[
		{"question": "¿Qué es un agujero negro?", "options": ["Un fenómeno espacial", "Un error físico", "Una distorsión en la luz", "Un tipo de estrella", "Una zona sin materia"], "correct_answer": 0},
		{"question": "¿Cuál es la capital de Japón?", "options": ["Tokio", "Osaka", "Kioto", "Seúl", "Pekín"], "correct_answer": 0},
		{"question": "¿Cuántos países hay en África?", "options": ["54", "50", "60", "47", "52"], "correct_answer": 0},
		{"question": "¿Qué año se fundó la ONU?", "options": ["1945", "1912", "1929", "1985", "1940"], "correct_answer": 0},
		{"question": "¿Qué elemento químico tiene el símbolo 'O'?", "options": ["Oxígeno", "Osmio", "Oro", "Oganesón", "Oxígeno-18"], "correct_answer": 0}
	]
]

var current_question_index = -1
var current_level_questions = []
var max_questions_per_level = 5
var used_hints = [] 

func load_level(current_level):
	if current_level < questions.size():
		current_level_questions = questions[current_level]
		current_question_index = -1
		load_next_question()
	else:
		label.text = "¡Fin del juego!"
		option_1.hide()
		option_2.hide()
		option_3.hide()
		option_4.hide()
		option_5.hide()

func load_next_question():
	if current_question_index < max_questions_per_level - 1:
		current_question_index += 1
		var question_data = current_level_questions[current_question_index]
		label.text = question_data.get("question", "Pregunta no encontrada")  # Texto por defecto si falta la clave "question"
		option_1.text = question_data.get("options", [])[0]  # Array vacío por defecto si falta la clave "options"
		option_2.text = question_data.get("options", [])[1]
		option_3.text = question_data.get("options", [])[2]
		option_4.text = question_data.get("options", [])[3]
		option_5.text = question_data.get("options", [])[4]
		# Accede a la respuesta correcta, y asegúrate de manejar claves faltantes de manera segura
		var correct_answer_index = question_data.get("correct_answer", -1)  # -1 si falta la clave
		if correct_answer_index != -1:
			# Ahora puedes usar el índice de la respuesta correcta para verificar la opción seleccionada más tarde
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
	current_question_index += 1
	load_level(current_question_index)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func check_answer(selected_option, button: Button):
	# Asegurarse de acceder a la pregunta del nivel actual
	var question_data = current_level_questions[current_question_index]
	
	# Comprobar si la opción seleccionada es correcta
	if selected_option == question_data["correct_answer"]:
		level_manager.add_key()  # Añadir una clave al nivel
		button.self_modulate = Color.GREEN  # Cambiar color del botón a verde si la respuesta es correcta
	else:
		button.self_modulate = Color.RED  # Cambiar color del botón a rojo si la respuesta es incorrecta
		
		# Verificar si se han repetido 3 veces en la misma área o bloque
		if (level_manager.visisted_block - level_manager.keys) == 3:
			print("Has repetido el año")
	
	# Reiniciar el temporizador para la siguiente pregunta
	timer.start()

func _on_option_1_pressed() -> void:
	check_answer(0, option_1)
	
func _on_option_2_pressed() -> void:
	check_answer(1, option_2)

func _on_option_3_pressed() -> void:
	check_answer(2, option_3)

func _on_option_4_pressed() -> void:
	check_answer(3, option_3)

func _on_option_5_pressed() -> void:
	check_answer(4, option_3)

func _on_timer_timeout() -> void:
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
	
func _on_help_pressed() -> void:
	if level_manager.score > 20 and used_hints.size() < 3:  # Solo permite hasta 3 pistas
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

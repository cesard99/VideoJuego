extends Node

const SAVE_PATH = "user://player_data.json"

# Guarda un diccionario en el archivo JSON
func save_data(data: Dictionary) -> void:
	var data_array = []  # Array para almacenar los datos

	# Si el archivo ya existe, cargar los datos existentes
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var json = JSON.new()
		var error = json.parse(content)
		if error == OK:
			data_array = json.get_data()  # Cargar los datos existentes
		else:
			print("Error al parsear el JSON existente.")

	# Agregar el nuevo dato al array
	data_array.append(data)

	# Guardar el array completo en el archivo
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(data_array, "\t"))
	file.close()
	print("Datos guardados correctamente:", data)

# Lee los datos del archivo JSON y los devuelve como un Array de diccionarios
func load_data() -> Array:
	if not FileAccess.file_exists(SAVE_PATH):
		print("Archivo no encontrado, retornando datos vacíos.")
		return []

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var error = json.parse(content)
	if error != OK:
		print("Error al leer el JSON.")
		return []
	
	return json.get_data()  # Devuelve el array de diccionarios

# Guarda el puntaje con nombre y fecha
func save(nombre: String, promedio: float) -> void:
	var fecha = Time.get_datetime_string_from_system()
	var datos = {
		"nombre": nombre,
		"fecha": fecha,
		"promedio": promedio
	}
	save_data(datos)

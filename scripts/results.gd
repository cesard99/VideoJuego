extends Control

@onready var names: Label = $VBoxContainer/Names

func _ready():
	# Llama al método load() de la otra clase
	var datos = DataManager.load_data()

	# Ordenar los datos por fecha (más reciente primero)
	datos.sort_custom(func(a, b): return a["promedio"] > b["promedio"])

	# Obtener solo los 10 últimos registros
	var ultimos_10 = datos.slice(max(0, datos.size() - 10), datos.size())

	# Construye la tabla en el Label
	if ultimos_10.size() > 0:
		# Encabezados
		var texto_tabla = format_fila(["Nombre", "Fecha", "Promedio"])
		texto_tabla += "\n"  # Separador entre encabezados y datos

		# Datos
		for puntaje in ultimos_10:
			var fila = [
				puntaje["nombre"],
				formatear_fecha(puntaje["fecha"]),  # Formatear la fecha al mostrarla
				"%.2f" % puntaje["promedio"]  # Formatear el puntaje con 2 decimales
			]
			texto_tabla += format_fila(fila) + "\n"

		names.text = texto_tabla
	else:
		names.text = "No hay datos guardados."

# Función para formatear una fila con espacios fijos
func format_fila(fila: Array) -> String:
	return "%-15s %-15s %15s" % [fila[0], fila[1], fila[2]]

# Función para formatear la fecha al mostrarla
func formatear_fecha(fecha: String) -> String:
	# Eliminar todo lo que viene después de la "T"
	var fecha_formateada = fecha.split("T")[0]
	return fecha_formateada

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GUI/menu.tscn")

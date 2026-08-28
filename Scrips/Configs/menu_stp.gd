extends Control
class_name Menu_stp

var Machine_ref:StateV2_player
signal Call_update(index)

@export var Label_fuerza:Label
@export var Label_resistencia:Label
@export var Label_velocidad:Label
@export var Label_agilidad:Label
@export var Label_tecnica:Label

func Set_labels(Target:String, Value = 0):
	match Target:
		"Set":
			Label_agilidad.text = str(Value)
			Label_resistencia.text = str(Value)
			Label_fuerza.text = str(Value)
			Label_velocidad.text = str(Value)
			Label_tecnica.text = str(Value)
		"Fuerza": Label_fuerza.text = str(Value)
		"Resistencia": Label_resistencia.text = str(Value)
		"Velocidad": Label_velocidad.text = str(Value)
		"Agilidad": Label_agilidad.text = str(Value)
		"Tecnica": Label_tecnica.text = str(Value)

func _Button_fuerza() -> void:
	Call_update.emit("Fuerza")

func _Button_resistencia() -> void:
	Call_update.emit("Resistencia")

func _Button_velocidad() -> void:
	Call_update.emit("Velocidad")

func _Button_agilidad() -> void:
	Call_update.emit("Agilidad")

func _Button_tecnica() -> void:
	Call_update.emit("Tecnica")

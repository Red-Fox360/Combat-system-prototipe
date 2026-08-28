extends MachineV2
class_name MachineV2_player

@export var Menu_ref:Menu_stp

# Signal of emit atrib
signal Emit_stats(index)

func _ready() -> void:
	Get_nodes()
	Current_state.Init_state()
	Update_atributes("Set")

func _process(delta: float) -> void:
	Facing = Input.get_axis("Left", "Right")
	if Facing == 1:
		Animations.flip_h = false
	elif Facing == -1:
		Animations.flip_h = true
	Current_state.Procces_state(delta)

func _physics_process(delta: float) -> void:
	Current_state.Physics_state(delta)
	Character.move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu_stp"):
		Menu_ref.visible = !Menu_ref.visible

func Update_atributes(Update:String):
	stp.Update_hability(Update)
	match Update:
		"Set": Menu_ref.Set_labels("Set")
		"Fuerza": Menu_ref.Set_labels(Update, stp.Fuerza)
		"Agilidad": Menu_ref.Set_labels(Update, stp.Agilidad)
		"Velocidad": Menu_ref.Set_labels(Update, stp.Velocidad)
		"Resistencia": Menu_ref.Set_labels(Update, stp.Resistencia)
		"Tecnica": Menu_ref.Set_labels(Update, stp.Tecnica)

func _Call_update_hab(index: Variant) -> void:
	Update_atributes(index)

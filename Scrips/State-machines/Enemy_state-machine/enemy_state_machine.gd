extends Node
class_name Enemy_machine

#region nodes
@export var Character:CharacterBody2D
@export var Animations:AnimatedSprite2D
@export var Ray_colision_right:RayCast2D
@export var Ray_colision_left:RayCast2D
@export var Range_attack:Area2D
@export var Ray_vision_left:RayCast2D
@export var Ray_vision_right:RayCast2D
#endregion

#region Machine vars
@export var Current_state:Enemy_state
var List_states = {}
var Facing_dir:int = -1
var Target:Node2D
#endregion

func _ready():
	Get_nodes()

func _process(delta):
	if Facing_dir == 1:
		Animations.flip_h = false
	else:
		Animations.flip_h = true
	Current_state.Enemy_procces(delta)

func _physics_process(delta):
	Current_state.Enemy_physic(delta)
	Character.move_and_slide()

func Change_state(Next_state:String):
	Current_state.Enemy_exit()
	Current_state = List_states[Next_state]
	Current_state.Enemy_init()

func Get_nodes():
	for child in get_children():
		if child is Enemy_state:
			child.Character = Character
			child.Animations = Animations
			child.Machine = self
			List_states[child.name] = child
	Current_state.Enemy_init()

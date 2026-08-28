# State Machine V2
extends Node
class_name MachineV2

@export var stp:STP

@export var Character:CharacterBody2D
@export var Animations:AnimatedSprite2D
var List_states:Dictionary = {}
@export var Current_state:StateV2
var Facing = 1

func Get_nodes():
	for child in get_children():
		if child is StateV2:
			child.Character = Character
			child.Animations = Animations
			child.Machine = self
			List_states[child.name] = child

func Change_state(Next_state:String):
	Current_state.Exit_state()
	Current_state = List_states[Next_state]
	Current_state.Init_state()

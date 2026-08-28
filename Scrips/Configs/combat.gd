extends Node2D

@export var Enemy_spawn:Node2D
@export var Big_demon:PackedScene
@export var Big_zombie:PackedScene
var Current_enemy

@export var player_ref:MachineV2_player
var life:Label
var defend:Label

signal Repeat_emition(index)

func _ready():
	life.text = str(0)
	defend.text = str(0)
	Current_enemy = Config_combat.Select_enemy
	match Current_enemy:
		0:
			get_node("Enemy-spawner").add_child(Big_demon.instantiate())
		1:
			get_node("Enemy-spawner").add_child(Big_zombie.instantiate())

func _on_buttonpanel_skill(index: Variant) -> void:
	if index == 2:
		get_tree().change_scene_to_file("res://Escens/Menus/init_menu.tscn")
	$"Player/Player_state_machine".Hability(index)

func Update_labels(Label_name):
	if Label_name == "life":
		life.text = str(0)
	elif Label_name == "defend":
		defend.text = str(0)

func _on_player_update_labels(index: Variant) -> void:
	Update_labels(index)

func _Player_emit(index: Variant) -> void:
	Repeat_emition.emit(index)

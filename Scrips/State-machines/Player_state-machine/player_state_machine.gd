extends Node
class_name Player_machine

#region Nodes vars
@export var Character:CharacterBody2D
@export var Animations:AnimatedSprite2D
@export var Camera:Camera2D
#endregion

#region machine vars 
var List_states = {}
var Current_state:Player_state
var Facing_dir = 1
#endregion

#region area attacks

#region area attack 1
@export var Attack_1_col_1:CollisionShape2D
@export var Attack_1_col_2:CollisionShape2D
#endregion

#region area attack 2
@export var Attack_2_col_1:CollisionShape2D
#endregion

#region area attack 3
@export var Attack_3_col_1:CollisionShape2D
#endregion

#endregion

#region player
var Life:int = 100
var Current_life:int
var Defend:int = 100
var Current_defend:int
var Enable_defend:bool = false
#endregion

signal Call_update_labels(index)

func _ready():
	for child in get_children():
		if child is Player_state:
			child.Character = Character
			child.Animations = Animations
			child.Machine = self
			List_states[child.name] = child
	Current_state = List_states["Player_state-idle"]
	Current_life = Life
	Current_defend = Defend

func _process(delta):
	Facing_dir = Input.get_axis("Left","Right")
	if Facing_dir == 1:
		Animations.flip_h = false
		Camera.position.x = 150
	elif Facing_dir == -1:
		Animations.flip_h = true
		Camera.position.x = -150
	Update_colisions()
	Current_state.Player_procces(delta)

func _physics_process(delta):
	Current_state.Player_physic(delta)
	Character.move_and_slide()

func Change_state(Name_state:String):
	Current_state.Player_exit()
	Current_state = List_states[Name_state]
	Current_state.Player_init()

func Update_colisions():
	if Current_state == List_states["Player_state-attack-1"]:
		if Animations.flip_h == false:
			Attack_1_col_1.position.x = -5
			Attack_1_col_2.position.x = 7.5
		else:
			Attack_1_col_1.position.x = 5
			Attack_1_col_2.position.x = -7.5
	elif Current_state == List_states["Player_state-attack-2"]:
		if Animations.flip_h == false:
			Attack_2_col_1.position.x = 1.5
		else:
			Attack_2_col_1.position.x = -1.5
	elif Current_state == List_states["Player_state-attack-3"]:
		if Animations.flip_h == false:
			Attack_3_col_1.position.x = 22
		else:
			Attack_3_col_1.position.x = -22

func _on_area_damagebox_area_entered(area: Area2D) -> void:
	var update
	if Current_life <= 0:
		get_tree().change_scene_to_file("res://Escens/Menus/dead_menu.tscn")
	if Enable_defend == false:
		Current_life -= 10
		update = "life"
	else:
		if Current_defend <= 0:
			Enable_defend = false
			Current_life -= 10
			return
		Current_defend -= 10
		update = "defend"
	Call_update_labels.emit(update)

func Hability(Skill):
	match Skill:
		0:
			Enable_defend = true
			await get_tree().create_timer(10).timeout
			Enable_defend = false
		1:
			Current_life = Life

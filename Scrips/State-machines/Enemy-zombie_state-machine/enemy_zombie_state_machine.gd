extends Node
class_name Zombie_machine

#region nodes
@export var Character:CharacterBody2D
@export var Animations:AnimatedSprite2D
@export var Area_vision:Area2D
@export var Ray_colision_left:RayCast2D
@export var Ray_colision_right:RayCast2D
@export var Area_attack:Area2D
@export var Colision_attack:CollisionShape2D
@export var Label_life:Label
#endregion

#region machine
@export var Current_state:Zombie_state
var List_states = {}
var Facing_dir = -1
var Target:Node2D
#endregion

#region Character
var Life:int = 100
var Current_life:int
#endregion

func _ready():
	Current_life = Life
	Label_life.text = str(Current_life)
	for child in get_children():
		if child is Zombie_state:
			child.Character = Character
			child.Animations = Animations
			child.Machine = self
			List_states[child.name] = child
	Current_state.Zombie_init()

func _process(delta):
	if Facing_dir == 1:
		Animations.flip_h = false
		Area_vision.scale.x = 1
	elif Facing_dir == -1:
		Animations.flip_h = true
		Area_vision.scale.x = -1
	Current_state.Zombie_procces(delta)
	if Current_life <= 0:
		get_tree().queue_delete(Character)
		queue_free()
		get_tree().change_scene_to_file("res://Escens/Menus/victory_menu.tscn")

func _physics_process(delta):
	Current_state.Zombie_physics(delta)
	Character.move_and_slide()

func Chage_state(Nex_state:String):
	Current_state.Zombie_exit()
	Current_state = List_states[Nex_state]
	Current_state.Zombie_init()

func _on_areadamage_area_entered(area: Area2D) -> void:
	Current_life -= 10
	Label_life.text = str(Current_life)

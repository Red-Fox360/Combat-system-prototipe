extends Node
class_name StateV2

var Character:CharacterBody2D
var Animations:AnimatedSprite2D
var Machine:MachineV2
var Gravity:float = 1000.0

func Init_state():
	pass

func Procces_state(delta):
	pass

func Physics_state(delta):
	pass

func Exit_state():
	pass

func Aply_gravity(delta):
	if !Character.is_on_floor():
		Character.velocity.y += Gravity * delta
	else:
		Character.velocity.y = 0

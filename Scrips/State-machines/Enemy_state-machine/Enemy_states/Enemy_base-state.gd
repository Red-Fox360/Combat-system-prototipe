extends Node
class_name Enemy_state

var Character:CharacterBody2D
var Animations:AnimatedSprite2D
var Machine:Enemy_machine

var Run_speed:float = 4000
var Patrol_speed:float = 3000
var Gravity:float = 300
var In_range:bool = false

func Enemy_init():
	pass
func Enemy_procces(delta):
	pass
func Enemy_physic(delta):
	pass
func Enemy_exit():
	pass

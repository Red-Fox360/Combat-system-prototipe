extends Node
class_name Zombie_state

var Character:CharacterBody2D
var Animations:AnimatedSprite2D
var Machine:Zombie_machine

var Chasing_speed:float = 4000
var Patrol_speed:float = 3000
var Gravity:float = 300
var Direction = 0
var Diferenc_y = 0

func Zombie_init():
	pass

func Zombie_procces(delta):
	pass

func Zombie_physics(delta):
	pass

func Zombie_exit():
	pass

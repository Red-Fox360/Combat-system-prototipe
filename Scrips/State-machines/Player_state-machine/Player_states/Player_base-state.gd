extends Node
class_name Player_state

var Character:CharacterBody2D
var Animations:AnimatedSprite2D
var Machine:Player_machine

var Run_speed:float = 8000
var Walk_speed:float = 3000
var Gravity:float = 300
var Jump_force:float = -200

func Player_init():pass

func Player_procces(delta):pass

func Player_physic(delta):pass

func Player_exit():pass

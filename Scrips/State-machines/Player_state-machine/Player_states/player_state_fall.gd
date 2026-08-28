extends Player_state

func Player_init():
	Animations.play("Fall")

func Player_procces(_delta):
	if Character.is_on_floor():
		Machine.Change_state("Player_state-idle")

func Player_physic(delta):
	Character.velocity.y += Gravity * delta
	if Input.is_action_pressed("Left"):
		Character.velocity.x = -Run_speed * delta
	elif Input.is_action_pressed("Right"):
		Character.velocity.x = Run_speed * delta
	else:
		Character.velocity.x = 0

func Player_exit():
	pass

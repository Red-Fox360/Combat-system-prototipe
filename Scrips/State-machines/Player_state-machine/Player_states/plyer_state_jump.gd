extends Player_state

func Player_init():
	Animations.play("Jump")
	Character.velocity.y = Jump_force

func Player_procces(delta):
	if  not Character.is_on_floor() and Character.velocity.y == Jump_force:
		Machine.Change_state("Player_state-fall")

func Player_physic(delta):
	if Input.is_action_pressed("Left"):
		Character.velocity.x = -Run_speed * delta
	elif Input.is_action_pressed("Right"):
		Character.velocity.x = Run_speed * delta
	else:
		Character.velocity.x = 0

func Player_exit():
	pass

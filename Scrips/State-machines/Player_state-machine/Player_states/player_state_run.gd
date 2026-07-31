extends Player_state

func Player_init():
	Animations.play("Run")

func Player_procces(delta):
	if !Character.is_on_floor():
		Machine.Change_state("Player_state-fall")
	if Input.is_action_pressed("Attack"):
		Machine.Change_state("Player_state-attack-1")
	elif Input.is_action_pressed("Jump"):
		Machine.Change_state("Player_state-jump")

func Player_physic(delta):
	if Input.is_action_pressed("Left"):
		Character.velocity.x = -Run_speed * delta
	elif Input.is_action_pressed("Right"):
		Character.velocity.x = Run_speed * delta
	else:
		Machine.Change_state("Player_state-idle")

func Player_exit():
	pass

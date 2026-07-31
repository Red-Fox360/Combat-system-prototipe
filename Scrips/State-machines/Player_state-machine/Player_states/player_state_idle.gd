extends Player_state

func Player_init():
	Animations.play("Idle")

func Player_procces(delta):
	if not Character.is_on_floor():
		Machine.Change_state("Player_state-fall")
	if Input.is_action_pressed("Attack"):
		Machine.Change_state("Player_state-attack-1")
	elif Input.is_action_just_pressed("Jump"):
		Machine.Change_state("Player_state-jump")
	elif Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		Machine.Change_state("Player_state-run")
	

func Player_physic(delta):
	Character.velocity.x = 0

func Player_exit():
	pass

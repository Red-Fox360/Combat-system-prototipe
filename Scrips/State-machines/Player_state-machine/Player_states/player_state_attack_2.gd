extends Player_state

func Player_init():
	Animations.play("Attack2")

func Player_procces(delta):
	if not Character.is_on_floor():
		Machine.Change_state("Player_state-fall")
	
	if Animations.frame == 1:
		Machine.Attack_2_col_1.disabled = false
	elif Animations.frame == 3:
		Machine.Attack_2_col_1.disabled = true
	
	await Animations.animation_finished
	
	if Input.is_action_pressed("Attack"):
		Machine.Change_state("Player_state-attack-3")
	else:
		Machine.Change_state("Player_state-idle")

func Player_physic(delta):
	Character.velocity.x = 0

func Player_exit():pass

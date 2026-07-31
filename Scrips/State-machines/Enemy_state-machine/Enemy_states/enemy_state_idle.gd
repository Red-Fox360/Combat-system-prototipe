extends Enemy_state

func Enemy_init():
	Animations.play("Idle")

func Enemy_procces(delta):
	if Character.is_on_floor():
		Machine.Change_state("Enemy_state-patrol")

func Enemy_physic(delta):
	Character.velocity.y += Gravity * delta

func Enemy_exit():
	pass

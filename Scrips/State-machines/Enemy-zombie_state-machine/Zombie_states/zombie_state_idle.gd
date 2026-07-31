extends Zombie_state

func Zombie_init():
	Animations.play("Idle")

func Zombie_procces(delta):
	if Character.is_on_floor():
		Machine.Chage_state("Zombie_state-patrol")

func Zombie_physics(delta):
	Character.velocity.y += Gravity * delta
	Character.velocity.x = 0

func Zombie_exit():
	pass

extends Zombie_state

func Zombie_init():
	Animations.modulate = Color.RED
	Animations.play("Attack")

func Zombie_procces(delta):
	Machine.Colision_attack.disabled = false
	await Animations.animation_looped
	Machine.Colision_attack.disabled = true
	if Direction > 10 || Direction < -10:
		if Direction > 10:
			Machine.Facing_dir = 1
			Machine.Chage_state("Zombie_state-chasing")
		elif Direction < -10:
			Machine.Facing_dir = -1
			Machine.Chage_state("Zombie_state-chasing")


func Zombie_physics(delta):
	Character.velocity.x = 0

func Zombie_exit():
	Animations.modulate = Color.WHITE
	Machine.Colision_attack.disabled = true

func _on_area_range_body_exited(body: Node2D) -> void:
	Machine.Chage_state("Zombie_state-chasing")

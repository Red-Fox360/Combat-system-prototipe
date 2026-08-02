extends Enemy_state

func Enemy_init():
	Animations.play("Attack")
	Animations.modulate = Color.RED

func Enemy_procces(delta):
	Machine.Colision_attack.disabled = false
	await Animations.animation_looped
	Machine.Colision_attack.disabled = true
	Direction_target = Machine.Target.global_position.x - Character.global_position.x
	if Direction_target > 5:
		Machine.Facing_dir = 1
		Machine.Change_state("Enemy_state-chasing")
	elif Direction_target < -5:
		Machine.Facing_dir = -1
		Machine.Change_state("Enemy_state-chasing")

func Enemy_physic(delta):
	Character.velocity.x = 0

func Enemy_exit():
	Animations.modulate = Color.WHITE
	Machine.Colision_attack.disabled = true

func _on_area_rangeattack_body_exited(body: Node2D) -> void:
	Machine.Change_state("Enemy_state-chasing")

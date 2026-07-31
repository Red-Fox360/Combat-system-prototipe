extends Enemy_state

func Enemy_init():
	Animations.play("Patrol")

func Enemy_procces(delta):
	if Machine.Facing_dir == 1:
		if Machine.Ray_vision_left.is_colliding():
			Machine.Target = Machine.Ray_vision_left.get_collider()
			Machine.Change_state("Enemy_state-run")
	else:
		if Machine.Ray_vision_right.is_colliding():
			Machine.Target = Machine.Ray_vision_right.get_collider()
			Machine.Change_state("Enemy_state-run")

func Enemy_physic(delta):
	Character.velocity.x = (Patrol_speed * Machine.Facing_dir) * delta
	if !Machine.Ray_colision_left.is_colliding():
		Machine.Facing_dir = -1
	elif !Machine.Ray_colision_right.is_colliding():
		Machine.Facing_dir = 1

func Enemy_exit():
	pass

extends Enemy_state

func Enemy_init():
	Animations.play("Patrol")

func Enemy_procces(delta):
	if Machine.Facing_dir == 1:
		if !Machine.Ray_colision_left.is_colliding():
			Machine.Facing_dir = -1
	elif Machine.Facing_dir == -1:
		if !Machine.Ray_colision_right.is_colliding():
			Machine.Facing_dir = 1

func Enemy_physic(delta):
	Character.velocity.x = (Patrol_speed * Machine.Facing_dir) * delta

func Enemy_exit():
	pass

func _on_area_vision_body_entered(body: Node2D) -> void:
	Machine.Target = body
	Machine.Change_state("Enemy_state-chasing")

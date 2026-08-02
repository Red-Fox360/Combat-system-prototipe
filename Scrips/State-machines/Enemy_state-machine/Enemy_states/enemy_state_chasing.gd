extends Enemy_state

var Edge:bool = false

func Enemy_init():
	Animations.play("Run")

func Enemy_procces(delta):
	Direction_target = Machine.Target.global_position.x - Character.global_position.x
	Difference_y = Machine.Target.global_position.y - Character.global_position.y
	if Direction_target > 0:
		Machine.Facing_dir = 1
	elif Direction_target < 0:
		Machine.Facing_dir = -1
	if Edge:
		if Machine.Facing_dir == 1 && !Machine.Ray_colision_right.is_colliding():
			Edge = false
		elif Machine.Facing_dir == -1 && !Machine.Ray_colision_left.is_colliding():
			Edge = false
		if Difference_y < -50 || Difference_y > 50:
			Edge = false
			Machine.Target = null
			Machine.Change_state("Enemy_state-patrol")
		if Direction_target > 100 || Direction_target < -100:
			Edge = false
			Machine.Target = null
			Machine.Change_state("Enemy_state-patrol")
	else:
		if Machine.Facing_dir == 1 && !Machine.Ray_colision_left.is_colliding():
			Edge = true
		elif Machine.Facing_dir == -1 && !Machine.Ray_colision_right.is_colliding():
			Edge = true
	if Direction_target > -10 && Direction_target < 10 && Difference_y > -50:
		Edge = false
		Machine.Change_state("Enemy_state-attack")

func Enemy_physic(delta):
	if Edge == false:
		if Machine.Facing_dir == 1:
			Character.velocity.x = Run_speed * delta
		elif Machine.Facing_dir == -1:
			Character.velocity.x = -Run_speed * delta
		Animations.play("Chasing")
	else:
		Character.velocity.x = 0
		Animations.play("Idle")

func Enemy_exit():
	pass

func _on_area_rangeattack_body_entered(body: Node2D) -> void:
	Machine.Change_state("Enemy_state-attack")

extends Zombie_state

var On_the_edge:bool = false

func Zombie_init():
	Animations.play("Chasing")

func Zombie_procces(delta):
	Direction = Machine.Target.global_position.x - Character.global_position.x
	Diferenc_y = Machine.Target.global_position.y - Character.global_position.y
	if 0 < Direction:
		Machine.Facing_dir = 1
	elif Direction < 0:
		Machine.Facing_dir = -1
	if On_the_edge:
		if Machine.Facing_dir == 1 && !Machine.Ray_colision_right.is_colliding():
			On_the_edge = false
		elif Machine.Facing_dir == -1 && !Machine.Ray_colision_left.is_colliding():
			On_the_edge = false
		if Diferenc_y < -50 || Diferenc_y > 50:
			On_the_edge = false
			Machine.Target = null
			Machine.Chage_state("Zombie_state-patrol")
	else:
		if Machine.Facing_dir == 1 && !Machine.Ray_colision_left.is_colliding():
			On_the_edge = true
		elif Machine.Facing_dir == -1 && !Machine.Ray_colision_right.is_colliding():
			On_the_edge = true
	if Direction < 10 && Direction > -10 && Diferenc_y > -50:
		On_the_edge = false
		Machine.Chage_state("Zombie_state-attack")

func Zombie_physics(delta):
	if On_the_edge == false:
		if Machine.Facing_dir == 1 && Direction > 5:
			Character.velocity.x = Chasing_speed * delta
		elif Machine.Facing_dir == -1 && Direction < -5:
			Character.velocity.x = -Chasing_speed * delta
		Animations.play("Chasing")
	else:
		Character.velocity.x = 0
		Animations.play("Idle")

func Zombie_exit():
	pass

func _on_area_range_body_entered(body: Node2D) -> void:
	Machine.Chage_state("Zombie_state-attack")

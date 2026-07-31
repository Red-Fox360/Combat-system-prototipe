extends Zombie_state

func Zombie_init():
	Animations.play("Patrol")

func Zombie_procces(delta):
	if Machine.Facing_dir == 1:
		if !Machine.Ray_colision_left.is_colliding():
			Machine.Facing_dir = -1
	elif Machine.Facing_dir == -1:
		if !Machine.Ray_colision_right.is_colliding():
			Machine.Facing_dir = 1

func Zombie_physics(delta):
	Character.velocity.x = (Patrol_speed * Machine.Facing_dir) * delta

func Zombie_exit():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	Machine.Target = body
	Machine.Chage_state("Zombie_state-chasing")

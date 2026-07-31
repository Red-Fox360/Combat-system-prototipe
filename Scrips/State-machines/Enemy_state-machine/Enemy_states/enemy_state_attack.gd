extends Enemy_state

func Enemy_init():
	Animations.play("Attack")

func Enemy_procces(delta):
	if In_range == false:
		Machine.Change_state("Enemy_state-patrol")

func Enemy_physic(delta):
	Character.velocity.x = 0

func Enemy_exit():
	pass

func _on_area_attack_body_exited(body: Node2D) -> void:
	In_range = false

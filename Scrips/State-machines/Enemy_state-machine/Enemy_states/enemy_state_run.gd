extends Enemy_state

var Diferens = 0
func Enemy_init():
	Animations.play("Run")

func Enemy_procces(delta):
	Diferens = Machine.Target.global_position.x - Character.global_position.x

func Enemy_physic(delta):
	Character.velocity.x = (Run_speed * Machine.Facing_dir) * delta
	Character.velocity.y += Gravity * delta
	if Diferens > 0:
		Machine.Facing_dir = 1
	elif Diferens < 0:
		Machine.Facing_dir = -1
	if Diferens > 100:
		Machine.Target = null
		Machine.Change_state("Enemy_state-idle")


func Enemy_exit():
	pass

func _on_area_attack_body_entered(body: Node2D) -> void:
	In_range = true

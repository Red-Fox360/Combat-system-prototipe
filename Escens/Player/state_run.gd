extends StateV2_player

func Init_state():
	Animations.play("Run")

func Procces_state(_delta):
	if !Character.is_on_floor():
		Machine.Change_state("State-fall")
	if Input.is_action_just_released("Run"):
		Machine.Change_state("State-walk")
	if Input.is_action_pressed("Jump"):
		Machine.Change_state("State-jump")

func Physics_state(_delta):
	if Machine.Facing != 0:
		Character.velocity.x = PlayerAtrib.Run_speed * Machine.Facing
	else:
		Machine.Change_state("State-idle")

func Exit_state():
	pass

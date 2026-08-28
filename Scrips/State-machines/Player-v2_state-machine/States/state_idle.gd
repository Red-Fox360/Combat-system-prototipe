extends StateV2_player

func Init_state():
	Animations.play("Idle")

func Procces_state(_delta):
	if !Character.is_on_floor():
		Machine.Change_state("State-fall")
	if Machine.Facing != 0:
		Machine.Change_state("State-walk")
	if Input.is_action_pressed("Run") && Machine.Facing != 0:
		Machine.Change_state("State-run")
	if Input.is_action_pressed("Jump"):
		Machine.Change_state("State-jump")

func Physics_state(_delta):
	Character.velocity.x = 0

func Exit_state():
	pass

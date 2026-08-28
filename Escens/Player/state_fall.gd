extends StateV2_player

func Init_state():
	if Animations.animation == "Jump":
		await Animations.animation_finished
	Animations.play("Fall")

func Procces_state(_delta):
	if Character.is_on_floor():
		Machine.Change_state("State-idle")

func Physics_state(delta):
	Aply_gravity(delta)
	if Machine.Facing != 0:
		Character.velocity.x = PlayerAtrib.Walk_speed * Machine.Facing
	else:
		Character.velocity.x = 0

func Exit_state():
	pass

extends StateV2_player

var Run_state:bool = false

func Init_state():
	if Animations.animation == "run":
		Run_state = true
	Animations.play("Jump")
	Character.velocity.y = Jump_force


func Procces_state(_delta):
	if not Character.is_on_floor() && Character.velocity.y == Jump_force:
		Machine.Change_state("State-fall")

func Physics_state(_delta):
	if Machine.Facing != 0:
		Character.velocity.x = PlayerAtrib.Walk_speed * Machine.Facing
	elif Run_state:
		Character.velocity.x = PlayerAtrib.Run_speed * Machine.Facing
	else:
		Character.velocity.x = 0

func Exit_state():
	pass

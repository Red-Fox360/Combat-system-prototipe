extends PanelContainer

@export var Name_hability:Label
@export var Description_hability:Label

@export var tab_bar:TabBar
@onready var current = tab_bar.current_tab
@onready var total = tab_bar.tab_count

signal skill(index)

func _ready():
	Update_info()

func Previus_tab():
	current = tab_bar.current_tab
	total = tab_bar.tab_count
	current -= 1
	if current < 0:
		current = total - 1
	tab_bar.current_tab = current
	Update_info()

func Next_tab():
	current = tab_bar.current_tab
	total = tab_bar.tab_count
	current+=1
	if current >= total:
		current = 0
	tab_bar.current_tab = current
	Update_info()

func Use_skill():
	skill.emit(tab_bar.current_tab)

func _unhandled_input(event):
	if event.is_action_pressed("Tab_next"):
		Next_tab()
	if event.is_action_pressed("Tab_previus"):
		Previus_tab()
	if event.is_action_pressed("Tab_use"):
		Use_skill()

func Update_info():
	match tab_bar.current_tab:
		0:
			Name_hability.text = "Immunity"
			Description_hability.text = "Immunity for 10 seconds"
		1:
			Name_hability.text = "Instan Healing"
			Description_hability.text = "Reset life"
		2:
			Name_hability.text = "Menu"
			Description_hability.text = "Execute Finish Game"

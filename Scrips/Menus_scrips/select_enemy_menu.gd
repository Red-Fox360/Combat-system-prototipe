extends Control

@export var Option_enemy:OptionButton

func _on_acept_button_pressed() -> void:
	Config_enemy.Select_enemy = Option_enemy.selected
	print(Config_enemy.Select_enemy)
	get_tree().change_scene_to_file("res://Escens/Interfaces/prueba_interfas.tscn")

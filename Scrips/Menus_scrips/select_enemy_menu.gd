extends Control

@export var Option_enemy:OptionButton

func _on_acept_button_pressed() -> void:
	Config_combat.Select_enemy = Option_enemy.selected
	get_tree().change_scene_to_file("res://Escens/Interfaces/prueba_interfas.tscn")

func _on_button_map_pressed() -> void:
	pass # Replace with function body.

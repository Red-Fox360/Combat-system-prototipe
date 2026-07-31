extends Control

func _on_init_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escens/Menus/select_enemy_menu.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

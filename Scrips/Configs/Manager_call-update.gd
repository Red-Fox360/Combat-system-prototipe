extends Node2D

signal Update_labels(index)

func _on_player_state_machine_call_update_labels(index: Variant) -> void:
	Update_labels.emit(index)

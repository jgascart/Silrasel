extends Node

@onready var player_resources: Control = $PlayerResources

var pause_menu_active : bool = false 

func _unhandled_input(event: InputEvent) -> void:
	if pause_menu_active && event.is_action_pressed("cancel"): 
		Session.unpause_game()
		pause_menu_active = false

func show_menu() -> void:
	player_resources.hide()

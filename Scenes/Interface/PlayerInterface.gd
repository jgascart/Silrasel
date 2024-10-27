extends Node

@onready var player_resources : Control = $PlayerResources
@onready var pause_menu : Control = $PauseMenu

@onready var menus : Array[Control] = [player_resources, pause_menu]

var pause_menu_active : bool = false 

func _unhandled_input(event : InputEvent) -> void:
	if pause_menu_active && event.is_action_pressed("cancel"): 
		Session.unpause_game()
		pause_menu_active = false
		show_menu(player_resources)

func show_menu(selected_menu : Control) -> void:
	for menu in menus:
		menu.hide()
		if menu == selected_menu:
			menu.show()
	

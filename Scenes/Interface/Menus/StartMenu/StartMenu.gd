extends Node
class_name StartMenu

@onready var main_menu : Control = $MainMenu
@onready var new_game_menu : Control = $NewGameMenu

@onready var menus : Array[Control] = [main_menu, new_game_menu]

enum MENU {
	MAIN_MENU,
	NEW_GAME_MENU,
	CONTINUE_MENU,
	SETTINGS_MENU,
	LANGUAGE_MENU
}

func _ready() -> void:
	show_menu(main_menu)
	for menu in menus:
		menu.select_menu.connect(select_menu)

func select_menu(menu : MENU) -> void:
	match menu:
		MENU.MAIN_MENU: show_menu(main_menu)
		MENU.NEW_GAME_MENU: show_menu(new_game_menu)
		2: pass
		3: pass
		4: pass
	
func show_menu(selected_menu : Control) -> void:
	for menu in menus:
		menu.visible = false
		menu.active = false
		if menu == selected_menu:
			menu.visible = true
			menu.active = true

extends Control

@onready var easy_button : Button = $EasyButton
@onready var normal_button : Button = $NormalButton
@onready var hard_button : Button = $HardButton
@onready var return_button : Button = $ReturnButton

@onready var menu_buttons : Array[Button] = [easy_button, normal_button, hard_button, return_button]

var menu_index : int = -1
var active : bool = false

signal select_menu(menu : int)

func _ready() -> void:
	for button : Button in menu_buttons:
		button.mouse_entered.connect(select_button.bind(button))
		button.button_down.connect(click_button.bind(button))

func _unhandled_input(event : InputEvent) -> void:
	if !active: return
	
	if event.is_action_pressed("move_down"):
		menu_index += 1
		if menu_index < 0: menu_index = 0
		if menu_index > 3: menu_index = 0
		select_button(menu_buttons[menu_index])
	if event.is_action_pressed("move_up"):
		menu_index -= 1
		if menu_index < 0: menu_index = 3
		if menu_index > 3: menu_index = 0
		select_button(menu_buttons[menu_index])
	if event.is_action_pressed("interact_button"):
		click_button(menu_buttons[menu_index])

func select_button(_selected_button : Button) -> void:
	pass

func click_button(selected_button : Button) -> void:
	if selected_button == easy_button: pass
	if selected_button == normal_button: pass
	if selected_button == hard_button: pass
	if selected_button == return_button: select_menu.emit(StartMenu.MENU.MAIN_MENU)

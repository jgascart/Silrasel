extends Control

const LANGUAGE_FILE = "res://Data/Languages.json"
var language_folder = "res://Data/" + Settings.settings["general"]["language"] + "/Text/Menus/Menus.json"

@onready var new_game_label : Label = $MenuMarginContainer/Menu/NewGameBackground/NewGameLabel
@onready var continue_label : Label = $MenuMarginContainer/Menu/ContinueBackground/ContinueLabel
@onready var settings_label : Label = $MenuMarginContainer/Menu/SettingsBackground/SettingsLabel
@onready var exit_label : Label = $MenuMarginContainer/Menu/ExitBackground/ExitLabel

@onready var new_game_button : Button = $MenuMarginContainer/Menu/NewGameBackground/NewGameButton
@onready var continue_button : Button = $MenuMarginContainer/Menu/ContinueBackground/ContinueButton
@onready var settings_button : Button = $MenuMarginContainer/Menu/SettingsBackground/SettingsButton
@onready var exit_button : Button = $MenuMarginContainer/Menu/ExitBackground/ExitButton

@onready var new_game_background : TextureRect = $MenuMarginContainer/Menu/NewGameBackground
@onready var continue_background : TextureRect = $MenuMarginContainer/Menu/ContinueBackground
@onready var settings_background : TextureRect = $MenuMarginContainer/Menu/SettingsBackground
@onready var exit_background : TextureRect = $MenuMarginContainer/Menu/ExitBackground

@onready var language_selector : OptionButton = $LanguageSelector

@onready var menu_sound_player : AudioStreamPlayer = $MenuSoundPlayer

const BUTTON_ON_TEXTURE : Texture2D = preload("res://Assets/Images/Menu/Button_on.png")
const BUTTON_OFF_TEXTURE : Texture2D = preload("res://Assets/Images/Menu/Button_off.png")

var menu_index : int = -1
var active : bool = false

@onready var menu_backgrounds : Array[TextureRect] = [new_game_background, continue_background, settings_background, exit_background]
@onready var menu_buttons : Array[Button] = [new_game_button, continue_button, settings_button, exit_button]

signal select_menu(menu : int)

func _ready() -> void:
	load_language()
	load_language_options()
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

func load_language() -> void:
	var file = FileAccess.open(language_folder, FileAccess.READ)
	
	if file:
		var result = JSON.parse_string(file.get_as_text())
		
		new_game_label.text = result["main_menu"]["new_game_button"]["text"]
		continue_label.text = result["main_menu"]["continue_button"]["text"]
		settings_label.text = result["main_menu"]["settings_button"]["text"]
		exit_label.text = result["main_menu"]["exit_button"]["text"]
		
		new_game_label.add_theme_font_size_override("font_size", result["main_menu"]["new_game_button"]["size"])
		continue_label.add_theme_font_size_override("font_size", result["main_menu"]["continue_button"]["size"])
		settings_label.add_theme_font_size_override("font_size",result["main_menu"]["settings_button"]["size"])
		exit_label.add_theme_font_size_override("font_size",result["main_menu"]["exit_button"]["size"])

func load_language_options() -> void:
	var file = FileAccess.open(LANGUAGE_FILE, FileAccess.READ)
	if file:
		var languages = JSON.parse_string(file.get_as_text())
	
		for language in languages["languages"]:
			language_selector.add_item(language["language"])

func select_button(selected_button : Button) -> void:
	if !active: return
	
	var index = 0
	menu_sound_player.play()
	for button : Button in menu_buttons:
		menu_backgrounds[index].texture = BUTTON_OFF_TEXTURE
		if button == selected_button:
			menu_backgrounds[index].texture = BUTTON_ON_TEXTURE
			menu_index = index
		index += 1

func click_button(selected_button : Button) -> void:
	if !active: return
	
	if selected_button == new_game_button: select_menu.emit(StartMenu.MENU.NEW_GAME_MENU)
	if selected_button == continue_button: select_menu.emit(StartMenu.MENU.CONTINUE_MENU)
	if selected_button == settings_button: select_menu.emit(StartMenu.MENU.SETTINGS_MENU)
	if selected_button == exit_button: get_tree().quit()

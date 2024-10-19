extends Control

const LANGUAGE_FILE = "res://Data/Languages.json"
var language_folder = "res://Data/" + Settings.settings["general"]["language"] + "/Text/Menus/Menus.json"

@onready var new_game_button: Button = $Menu/NewGameButton
@onready var continue_button: Button = $Menu/ContinueButton
@onready var settings_button: Button = $Menu/SettingsButton
@onready var exit_button: Button = $Menu/ExitButton
@onready var language_selector: OptionButton = $LanguageSelector

func _ready() -> void:
	load_language()
	load_language_options()
	
func load_language() -> void:
	var file = FileAccess.open(language_folder, FileAccess.READ)
	
	if file:
		var result = JSON.parse_string(file.get_as_text())
		
		new_game_button.text = result["main_menu"]["new_game_button"]
		continue_button.text = result["main_menu"]["continue_button"]
		settings_button.text = result["main_menu"]["settings_button"]
		exit_button.text = result["main_menu"]["exit_button"]

func load_language_options() -> void:
	var file = FileAccess.open(LANGUAGE_FILE, FileAccess.READ)
	if file:
		var languages = JSON.parse_string(file.get_as_text())
	
		for language in languages["languages"]:
			language_selector.add_item(language["language"])

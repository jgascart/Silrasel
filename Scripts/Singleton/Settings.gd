extends Node

const SETTINGS_FILE = "res://Config.ini"

var settings = {
	"video" : {
		"full_screen" = false
	} ,
	"sound" :{
		"master" = 100,
		"sfx" = 100,
		"music" = 100
	},
	"keybinds" :{
		"move_up" = 0,
		"mode_down" = 0,
		"move_right" = 0,
		"move_left" = 0
	} 
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_settings()
	
func load_settings():
	var file = ConfigFile.new()
	var error = file.load(SETTINGS_FILE)
	
	if error == OK:
		for section : String in settings.keys():
			for key in settings[section]:
				if settings[section].has(key): settings[section][key] = file.get_value(section, key, settings[section][key])

func save_settings() -> void:
	var file = ConfigFile.new()
	
	for section : String in settings.keys():
		for key in settings[section]:
			file.set_value(section, key, settings[section][key])
	
	file.save(SETTINGS_FILE)

class_name Game

enum DIFFICULTY {
	EASY,
	NORMAL,
	HARD
}

var game_difficulty : DIFFICULTY

enum GAME_FLAG {
	FLAG_TUTORIAL,
	FLAG_FLAG1,
	FLAG_FLAG2
}

var game_flags : int = 0
var player_interface : Node
var world : World
var player : Player

func set_game_flag(flag : GAME_FLAG) -> void:
	game_flags |= 1 << flag 

func get_game_flag(flag : GAME_FLAG) -> int:
	return game_flags & (1 << flag)

func new_game(difficulty : DIFFICULTY) -> void:
	game_difficulty = difficulty
	player = Player.new()

func save_game(_slot : int) -> void:
	pass
	
func load_game(_slot : int) -> void:
	pass

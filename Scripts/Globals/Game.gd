extends Node

enum DIFFICULTY {
	EASY,
	NORMAL,
	HARD
}

var difficulty : int = 0

enum GAME_FLAG {
	FLAG_TUTORIAL,
	FLAG_FLAG1,
	FLAG_FLAG2
}

var game_flags : int = 0

func set_game_flag(flag : GAME_FLAG) -> void:
	game_flags |= 1 << flag 

func get_game_flag(flag : GAME_FLAG) -> int:
	return game_flags & (1 << flag)

func new_game(_difficulty : DIFFICULTY) -> void:
	pass

func save_game(_slot : int) -> void:
	pass
	
func load_game(_slot : int) -> void:
	pass

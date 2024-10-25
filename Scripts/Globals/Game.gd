extends Node

enum DIFFICULTY {
	EASY,
	NORMAL,
	HARD
}

var difficulty : DIFFICULTY = DIFFICULTY.EASY

enum GAME_FLAG {
	FLAG_TUTORIAL,
	FLAG_FLAG1,
	FLAG_FLAG2
}

var game_flags : int = 0
var world : World
var player : Player

func set_game_flag(flag : GAME_FLAG) -> void:
	game_flags |= 1 << flag 

func get_game_flag(flag : GAME_FLAG) -> int:
	return game_flags & (1 << flag)

func new_game(difficulty : DIFFICULTY) -> void:
	difficulty = difficulty
	start_world()
	#TODO: 

func start_world() -> void:
	# Start Game Interface
	add_child(load("res://Scenes/Interface/PlayerInterface.tscn").instantiate())
	
	# Start World
	world = World.new()
	world.name = "World"
	add_child(world)
	
	# Start Maps
	world.add_child(load("res://Scenes/Maps/Maps.tscn").instantiate())
	
	# Start Player
	player = Player.new()
	player.name = "Player"
	world.add_child(player)
	player.add_child(load("res://Scenes/Entities/Characters/Aeldrya/Aeldrya.tscn").instantiate())

func save_game(_slot : int) -> void:
	pass
	
func load_game(_slot : int) -> void:
	pass

extends Node

#  root
#	Settings
#	Session -> (Controls playtime) -> points to Interface, Game and world
#   Main
#		Interface
#		Game -> (Flags, Player, Storage) -> [Save data]
#		World
#			Maps
#			Aeldrya

var interface : Node
var game : Game
var world : World

var paused = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS # never pause the sessión

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel") && !paused: 
		get_tree().paused = true
		paused = true
	elif event.is_action_pressed("cancel") && paused:
		get_tree().paused = false
		paused = false

func new_game(difficulty : Game.DIFFICULTY) -> void:
	game = Game.new()
	game.new_game(difficulty)
	#TODO: Initialize player to difficulty
	
	start_world()

func start_world() -> void:
	var main = get_node("/root/Main")
	
	# Start Game Interface TODO: Isolate Node
	interface = load("res://Scenes/Interface/PlayerInterface.tscn").instantiate()
	world = World.new()
	
	main.add_child(interface)
	main.add_child(world)
	
	# Start Maps Node
	world.add_child(load("res://Scenes/Maps/Maps.tscn").instantiate())
	
	# Start "Player" TODO: Instantiate Aeldrya on World
	world.add_child(load("res://Scenes/Entities/Characters/Aeldrya/Aeldrya.tscn").instantiate())
	
	world.name = "World"
extends Node
class_name World

enum MAP {
	KIRALITH_ENTRANCE,
	MAGIC_TOWER_BASEMENT
}

var maps_node : Node

func _ready() -> void:
	# Start Maps Node
	maps_node = load("res://Scenes/Maps/Maps.tscn").instantiate()
	add_child(maps_node)

func load_map(map : MAP) -> void:
	var map_instance : Node2D = null
	match map:
		MAP.KIRALITH_ENTRANCE: 
			map_instance = load("res://Scenes/Maps/Outdors/Kiralith/KiralithEntrance.tscn").instantiate()
		MAP.MAGIC_TOWER_BASEMENT:
			map_instance = load("res://Scenes/Maps/Indors/MagicTower/Basement.tscn").instantiate()
	
	if (map_instance != null): maps_node.add_child(map_instance)

func unload_map(map : MAP) -> void:
	pass

func unload_all_maps() -> void:
	var maps = maps_node.get_children()
	for map in maps:
		map.queue_free()

extends Node
class_name World

enum MAP {
	KIRALITH_ENTRANCE
}

var maps_node : Node

func _ready() -> void:
	# Start Maps Node
	maps_node = load("res://Scenes/Maps/Maps.tscn").instantiate()
	add_child(maps_node)

func load_map(map : MAP) -> void:
	var map_instance = null
	match map:
		MAP.KIRALITH_ENTRANCE: 
			map_instance = load("res://Scenes/Maps/Outdors/Kiralith/KiralithEntrance.tscn").instantiate()
	
	if (map_instance != null): maps_node.add_child(map_instance)

extends Control

@onready var magic_tower_basement: Button = $MagicTowerBasement

func _on_magic_tower_basement_pressed() -> void:
	Session.world.unload_all_maps()
	Session.world.load_map(World.MAP.MAGIC_TOWER_BASEMENT)

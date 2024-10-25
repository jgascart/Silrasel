extends Node
class_name Player

var stats : Dictionary = {
	# Base Stats (Level + stat points)
	"level" : 1,
	"current_exp" : 0,
	"next_level_exp" : 300,
	"stat_points" : 0,
	
	"base_hit_points" : 15,
	"base_mana_points" : 15,
	"base_vitality" : 4,      # 1vit = 2hp
	"base_strenght" : 3,      
	"base_agility" : 6,       # 1ag = +100 velocity? -> test out
	"base_intelect" : 4,      # Mana regen MP/min
	"base_magic_power" : 5,   # Magic damage + mp +1 = +1
	
	# Current Stats (Base Stats + Class + Enchants)
	"current_hp" : 0,
	"max_hp" : 0,
	"current_mp" : 0,
	"max_mp" : 0,
	"stamina" : 100,
	"max_speed" : 100,
	
	"vitality" : 0,
	"strenght" : 0,
	"agility" : 0,
	"intelect" : 0,
	"magic_power" : 0
}

func level_up():
	stats["level"] += 1
	stats["base_hit_points"] += 3
	stats["base_mana_points"] += 5
	stats["stat_points"] += 3
	stats["current_hp"] += 3
	stats["current_mp"] += 5
	stats["current_exp"] -= stats["next_level_exp"]
	stats["next_level_exp"] = int(stats["next_level_exp"] * 1.5)
	if stats["current_exp"] >= stats["next_level_exp"]: level_up()
	calculate_stats()

func calculate_stats():	
	# TODO: Add class stat points
	
	#############################
	
	stats["max_hp"] = stats["base_hit_points"] + (stats["vitality"] * 2)
	stats["max_mp"] = stats["base_mana_points"] + stats["magic_power"]

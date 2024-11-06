extends Node2D

@export var max_level_spawn : int = 1
@export var spawns : Array[String] = []

# Why gdscript doesn't have structs? Why can't you be normal? Why!!!!
var spawn_data : Array[Dictionary] = []

@onready var spawn_timer: Timer = $SpawnTimer

func _ready() -> void:
	spawn_timer.timeout.connect(_on_timer_timeout)
	var enemy_list = EnemyData.new()
	for spawn in spawns:
		if enemy_list.enemy_list.has(spawn):
			spawn_data.append(enemy_list.enemy_list[spawn])
	
	spawn_enemy()

func spawn_enemy() -> void:
	if spawn_data.is_empty(): return # Should not happen if i'm not an idiot or gdscript is retarded
	var spawn : int = randi_range(0, spawn_data.size() - 1) # I hate you!
	var spawn_point : Vector2 = Vector2(randi_range(0, 300), randi_range(0, 300))
	var enemy = load(spawn_data[spawn]["Sceene"]).instantiate()
	enemy.position = spawn_point
	
	# Set the level and initialize stats
	enemy.spawn(randi_range(0, max_level_spawn), spawn_data[spawn]["Grade"], spawn_data[spawn]["Type"])
	
	# TODO: Add to an independent node
	add_child(enemy)

func _on_timer_timeout() -> void:
	spawn_enemy()

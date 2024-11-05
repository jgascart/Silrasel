extends CharacterBody2D
class_name Enemy

var enemy_name : String = ""

var level : int = 0

var hit_points : int = 0
var max_hit_points : int = 0
var mana_points : int = 0
var max_mana_points : int = 0

var vitality : int = 0
var strenght : int = 0
var agility : int = 0
var intelect : int = 0
var magic_power : int = 0

enum ENEMY_TYPE {
	NONE,
	WANDERER,
	HUNTER,
	STALKER,
	AMBUSHER
}

var type : ENEMY_TYPE = ENEMY_TYPE.NONE

enum ENEMY_GRADE {
	GRADE_NONE,
	GRADE_1
}

var grade : ENEMY_GRADE = ENEMY_GRADE.GRADE_NONE

var is_dead : bool = false
var target = null

@onready var hp_label: Label = $HPLabel

func _ready() -> void:
	update_stats()

func update_stats() -> void:
	hp_label.text = "HP: " + str(hit_points) + "/" + str(max_hit_points)

func set_stats() -> void:
	match grade:
		ENEMY_GRADE.GRADE_1:
			max_hit_points = (randi() % 40) + 1
			max_mana_points = randi() % 61
			
			vitality = (randi() % 10) + 1
			strenght = (randi() % 10) + 1  
			agility = (randi() % 10) + 1      
			intelect = (randi() % 10) + 1    
			magic_power = (randi() % 10)
			
			var stat_points = 25 + (5 * level)
			while stat_points > 0:
				var stat = randi() % 5
				match stat:
					0: vitality += 1
					1: strenght += 1
					2: agility += 1
					3: intelect += 1
					4: magic_power += 1
				stat_points -= 1
			
			max_hit_points += vitality * 2
			hit_points = max_hit_points
			max_mana_points += magic_power
			mana_points += max_mana_points

func take_damage(damage : int) -> void:
	if !is_dead:
		hit_points -= damage
		if hit_points <= 0: 
			hit_points = 0
			die()
		update_stats()

func die():
	Session.game.player.gain_exp(level, grade)
	is_dead = true

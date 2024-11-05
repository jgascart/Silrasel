extends Node

@onready var enemy: Enemy = $".."
@onready var hitbox: Area2D = $"../Hitbox"

func _ready() -> void:
	enemy.grade = Enemy.ENEMY_GRADE.GRADE_1
	enemy.level = 1
	enemy.set_stats()

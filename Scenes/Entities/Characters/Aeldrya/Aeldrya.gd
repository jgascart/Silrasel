extends CharacterBody2D

const SPEED = 200
@onready var animations : AnimatedSprite2D = $AeldryaAnimations
var move_direction = Vector2(0,0)

func _physics_process(_delta: float) -> void:
	move()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action_button_0"):
		handle_action()

func move() -> void:
	move_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	move_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = move_direction.normalized() * SPEED
	
	animations.animate_movement(move_direction)
	
	move_and_slide()

#TODO: Move to correct place
@onready var skill_point : Marker2D = $Direction/SkillPoint
@onready var direction : Node2D = $Direction
@onready var skills : Node = $Skills
#########


func handle_action():
	#TODO: Handle individuall spells
	const FIREBALL_SCEENE : PackedScene = preload("res://Scenes/Skills/Fireball/Fireball.tscn")
	var fireball = FIREBALL_SCEENE.instantiate()
	fireball.global_position = skill_point.global_position
	fireball.rotation = direction.rotation
	
	# Add as a child of another node (?)
	skills.add_child(fireball)

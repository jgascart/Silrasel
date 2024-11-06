extends CharacterBody2D

const SPEED = 200
@onready var animations : AnimatedSprite2D = $AeldryaAnimations
var move_direction = Vector2(0,0)
@onready var direction: Node2D = $Direction
var running : bool = false

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("run"): running = true
	else: running = false
	move()

func _process(delta: float) -> void:
	if running && move_direction != Vector2(0,0): Session.game.player.stats["stamina"] -= 1 * delta
	elif Session.game.player.stats["stamina"] < 100: Session.game.player.stats["stamina"] = clampf(Session.game.player.stats["stamina"] + 1 * delta, 0, 100)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action_button_0"):
		handle_action()

func move() -> void:
	move_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	move_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = move_direction.normalized() * SPEED
	
	animations.animate_movement(move_direction)
		
	if running:
		velocity *= 2 #TODO: Calculate agility
		
	move_and_slide()

#TODO: Move to correct place
@onready var skill_point : Marker2D = $Direction/SkillPoint
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

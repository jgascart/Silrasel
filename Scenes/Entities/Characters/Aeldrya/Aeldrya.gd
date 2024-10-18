extends CharacterBody2D

const SPEED = 200
var move_direction = Vector2(0,0)

func _physics_process(_delta: float) -> void:
	move()

func move() -> void:
	move_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	move_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = move_direction.normalized() * SPEED
	
	$AeldryaAnimations.animate_movement(move_direction)
	
	move_and_slide()

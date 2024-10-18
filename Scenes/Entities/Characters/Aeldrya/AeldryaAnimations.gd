extends AnimatedSprite2D

var move_animation : String = "idle_down"

func animate_movement(move_direction : Vector2) -> void:
	match move_direction:
		Vector2(-1, 0):
			move_animation = "run_left"
		Vector2(-1, -1):
			move_animation = "run_up_left"
		Vector2(-1, 1):
			move_animation = "run_down_left"
		Vector2(0, -1):
			move_animation = "run_up"
		Vector2(0, 0):
			match move_animation:
				"run_down" : move_animation = "idle_down"
				"run_down_left" : move_animation = "idle_down_left"
				"run_down_right" : move_animation = "idle_down_right"
				"run_left" : move_animation = "idle_left"
				"run_right" : move_animation = "idle_right"
				"run_up" : move_animation = "idle_up"
				"run_up_left" : move_animation = "idle_up_left"
				"run_up_right" : move_animation = "idle_up_right"
		Vector2(0, 1):
			move_animation = "run_down"
		Vector2(1, -1):
			move_animation = "run_up_right"
		Vector2(1, 0):
			move_animation = "run_right"
		Vector2(1,1):
			move_animation = "run_down_right"
		
	play(move_animation)

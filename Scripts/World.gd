extends Node
class_name World

signal pause
var paused : bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		pause.emit()
		get_tree().paused = true

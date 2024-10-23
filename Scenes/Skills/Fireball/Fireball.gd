extends Area2D

const SPEED : float = 500.0
const MAX_DISTANCE :float = 600.0
var travelled_distance : float = 0.0

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > MAX_DISTANCE: queue_free()

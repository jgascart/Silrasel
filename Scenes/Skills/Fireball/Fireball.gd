extends Area2D

const BASE_DAMAGE : int = 10
const SPEED : float = 500.0
const MAX_DISTANCE :float = 600.0
var travelled_distance : float = 0.0

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > MAX_DISTANCE: queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"): body.take_damage(BASE_DAMAGE)
	queue_free()

extends Node

@onready var player_resources: Control = $PlayerResources

func show_menu() -> void:
	player_resources.hide()

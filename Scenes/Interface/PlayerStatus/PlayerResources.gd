extends Control

@onready var health_bar : ProgressBar = $HealthBar
@onready var mana_bar : ProgressBar = $ManaBar
@onready var stamina_bar : ProgressBar = $StaminaBar

@onready var health_label: Label = $HealthBar/HealthLabel
@onready var mana_label: Label = $ManaBar/ManaLabel
@onready var stamina_label: Label = $StaminaBar/StaminaLabel

func _process(_delta : float) -> void:
	# Calculate variable stats
	var health : float = 1.0 # To avoid divide by zero
	if Session.game.player.stats["max_hp"] > 0: 
		health = Session.game.player.stats["current_hp"] * 100 / Session.game.player.stats["max_hp"]
	health_bar.value = health
	health_label.text = str(Session.game.player.stats["current_hp"]) + "/" + str(Session.game.player.stats["max_hp"])
	
	var mana : float = 1.0
	if Session.game.player.stats["max_hp"] > 0:
		mana = Session.game.player.stats["current_mp"] * 100 / Session.game.player.stats["max_mp"]
	mana_bar.value = mana
	mana_label.text = str(Session.game.player.stats["current_mp"]) + "/" + str(Session.game.player.stats["max_mp"])
	
	stamina_bar.value = Session.game.player.stats["stamina"]
	stamina_label.text = str(Session.game.player.stats["stamina"])

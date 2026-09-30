extends Control

const COIN = preload("res://coin.tscn")
@export var game_manager: Node
var strength: int = 1
signal coin_generated(amount: int)

func _on_upgradebutton_pressed() -> void:
	var cost = strength * 3
	if game_manager.coin >= cost:
		strength *= 2
		coin_generated.emit(-cost)

func _on_timer_timeout() -> void:
	coin_generated.emit(strength)
	var c = COIN.instantiate()
	c.position = $TextureRect.global_position + $TextureRect.size / 2
	get_tree().current_scene.add_child(c)

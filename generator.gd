extends Control

const COIN = preload("res://coin.tscn")
@export var game_manager: Node
@export var base_strength: int = 1  
@export var base_cost: int = 3 
var strength: int = 0
signal coin_generated(amount: int)

@export var wait_time: float = 1.0

func _ready() -> void:
	$Timer.wait_time = wait_time

func _on_upgradebutton_pressed() -> void:
	var cost = base_cost if strength == 0 else strength * 3
	if game_manager.coin >= cost:
		strength = base_strength if strength == 0 else strength * 2
		coin_generated.emit(-cost)

func _on_timer_timeout() -> void:
	if strength == 0:
		return
	coin_generated.emit(strength)
	var c = COIN.instantiate()
	c.position = $TextureRect.global_position + $TextureRect.size / 2
	get_tree().current_scene.add_child(c)

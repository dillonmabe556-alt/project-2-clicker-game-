extends Control

var coin: int = 0
@onready var coin_label: Label = $coinLabel
#@export var clicker_power: int = 10

func _on_button_down() -> void:
	#print("hi")
	coin += clicker_power
	coin_label.text = "coin: " + str(coin)
	print(coin)


#func _on_upgrade_button_pressed() -> void:
	#clicker_power = clicker_power * 2

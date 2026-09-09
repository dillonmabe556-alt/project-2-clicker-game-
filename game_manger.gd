extends Control

var coin: int = 0
@onready var clicker_button_path :Button = $clickerButton
@onready var coin_label: Label = $coinLabel

#@export var clicker_power: int = 10
func _ready() -> void:
	clicker_button_path.clicked.connect(_on_button_down)
func _on_button_down(clicker_power) -> void:
	
	#print("hi")
	coin += clicker_power
	coin_label.text = "coin: " + str(coin)
	print(coin)


#func _on_upgrade_button_pressed() -> void:
	#clicker_power = clicker_power * 2

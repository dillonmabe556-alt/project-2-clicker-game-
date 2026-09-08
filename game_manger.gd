extends Control
var coin: int = 0
@onready var coin_label: Label = $coinLabel
@export var clicker_power: int = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	#print("hi")
	coin += clicker_power
	coin_label.text = "coin: " + str(coin)
	print(coin)


func _on_upgrade_button_pressed() -> void:
	print("upgrade pressed")
	clicker_power = clicker_power * 2

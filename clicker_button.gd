extends Button

@export var clicker_power: int = 10
signal clicked(clicker_power :int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_upgrade_button_pressed() -> void:
	clicker_power = clicker_power * 2
	
func _on_pressed() -> void:
	clicked.emit(clicker_power)

extends Button

@export var clicker_power: int = 10
@onready var coin_scene: PackedScene = load("res://coin.tscn")
signal clicked(clicker_power :int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		pressed.connect(_on_pressed)
		$upgradeButton.pressed.connect(_on_upgrade_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass


func _on_pressed() -> void:
		var c = coin_scene.instantiate()
		add_child(c)
		c.global_position = get_global_mouse_position()
		clicked.emit(clicker_power)
func _on_upgrade_button_pressed() -> void:
		clicker_power *= 2
		print("upgraded",clicker_power)	

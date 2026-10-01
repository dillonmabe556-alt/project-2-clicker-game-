extends Button

@export var clicker_power: int = 10
@onready var coin_scene: PackedScene = load("res://coin.tscn")

@export var game_manager: Node

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
		c.global_position = get_global_mouse_position()
		get_tree().current_scene.add_child(c)
		print(get_global_mouse_position(),c.global_position)
		clicked.emit(clicker_power)
		$AnimatedSprite2D.play("default")
func _on_upgrade_button_pressed() -> void:
	var cost: int = clicker_power*3
	if game_manager.coin >= cost:
		clicker_power *= 2
		print("upgraded",clicker_power)	
		clicked.emit(-cost)

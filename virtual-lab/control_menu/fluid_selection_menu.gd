extends Control
@onready var player = get_node("../../Player")
@onready var brown = get_node("../../Bentonite")
@onready var red = get_node("../../Ketchup")
@onready var blue = get_node("../../Water")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_no_pressed() -> void:
	$".".visible = false
	player.captureMouse()
	

func _on_yes_pressed() -> void:
	var fluid = player.getLiquidType()
	match fluid:
		1:
			print("brown")
			$".".visible = false
			brown.putInMachine()
			player.captureMouse()
		2:
			print("red")
			$".".visible = false
			red.putInMachine()
			player.captureMouse()
		3:
			print("Blue")
			$".".visible = false
			blue.putInMachine()
			player.captureMouse()

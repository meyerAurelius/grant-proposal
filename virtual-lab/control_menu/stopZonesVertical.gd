extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw():
	draw_rect(Rect2(-25,-25, 50,100) , Color.ALICE_BLUE)
	
func select():
	for child in get_tree().get_nodes_in_group("DropZone"):
		child.deselect()
	modulate = Color.AQUA
	
func deselect():
	modulate = Color.ALICE_BLUE

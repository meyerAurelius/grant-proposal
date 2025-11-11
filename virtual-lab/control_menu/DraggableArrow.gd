extends Sprite2D

@onready var leverAnimation = get_node("../../../Mesh/Lever Base/LeverAnimation")


var clicked = false
var rest_point
var rest_nodes = []

const MIN_X = 1200
const MAX_X = 1750



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rest_nodes = get_tree().get_nodes_in_group("DropZone")
	rest_point = rest_nodes[1].global_position
	rest_nodes[1].select()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click"):
		clicked = true
		print("hit")
		
func _physics_process(delta: float) -> void:
	if clicked:
		global_position.x = lerp(global_position.x, get_global_mouse_position().x, 20 * delta)
		global_position.x = clamp(global_position.x, MIN_X, MAX_X)
	else:
		global_position.x = lerp(global_position.x, (rest_point.x + 40), 10 * delta)
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			clicked = false
			var shortest_dist = 125
			var selected_node = null
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					selected_node = child
					rest_point = child.global_position
					
			if selected_node:
				selected_node.select()
				playSpecificAnimaiton(selected_node)

func playSpecificAnimaiton(node):
	match node.name:
		"Low":
			leverAnimation.play("LeverLow")
		"Med":
			leverAnimation.play("RESET")
		"High":
			leverAnimation.play("LeverHigh")
		_:
			leverAnimation.play("RESET")
		

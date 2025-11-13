extends Sprite2D

@onready var leverAnimation = get_node("../../../Mesh/PullStick")


var clicked = false
var rest_point
var rest_nodes = []
@export var pullpos = 0

const MIN_Y = 400
const MAX_Y = 800




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rest_nodes = get_tree().get_nodes_in_group("DropZone")
	rest_point = rest_nodes[1].global_position
	rest_nodes[1].select()




func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click"):
		clicked = true
		
		
func _physics_process(delta: float) -> void:
	if clicked:
		global_position.y = lerp(global_position.y, get_global_mouse_position().y, 20 * delta)
		global_position.y = clamp(global_position.y, MIN_Y, MAX_Y)
	else:
		global_position.y = lerp(global_position.y, (rest_point.y + 20), 10 * delta)
		
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
			leverAnimation.lowposAnimation()
			pullpos = 0
		"Med":
			leverAnimation.medposAnimation()
			pullpos = 1
		"High":
			leverAnimation.highposAnimation()
			pullpos = 2
		_:
			leverAnimation.medposAnimation()
		

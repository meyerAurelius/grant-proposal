extends Sprite2D

@onready var leverAnimation = get_node("../../../Viscometer/Lever Base/LeverStick")
@onready var rpm = get_node("../../RPMSelector")

var clicked = false
var rest_point
var rest_nodes = []
@export var leverpos = 0

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
		
		
func _physics_process(delta: float) -> void:
	if clicked:
		global_position.x = lerp(global_position.x, get_global_mouse_position().x, 20 * delta)
		global_position.x = clamp(global_position.x, MIN_X, MAX_X)
	else:
		global_position.x = lerp(global_position.x, (rest_point.x + 20), 10 * delta)
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			clicked = false
			var shortest_dist = 75
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
		"0":
			leverAnimation.lowposAnimation()
			rpm.setRPM(0)
			leverpos = 0
		"100":
			leverAnimation.hunposAnimation()
			rpm.setRPM(100)
		"200":
			leverAnimation.medposAnimation()
			leverpos = 1
			rpm.setRPM(200)
		"300":
			leverAnimation.threeHunposAnimation()
			rpm.setRPM(300)
		"600":
			leverAnimation.highposAnimation()
			leverpos = 2
			rpm.setRPM(600)
		_:
			leverAnimation.medposAnimation()
		

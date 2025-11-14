extends MeshInstance3D
@onready var machineBase = get_node("../Viscometer/Machine Base")

var pos = Vector3(-0.012,1.874,0.367)
var machinePos = Vector3(-0.289,0.64, -0.07)
var posUp = Vector3(-0.012,2.25,0.367)

var tween = create_tween()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func putInMachine():
	tween = create_tween()
	tween.tween_property($"." , "global_position", pos, 1.5)
	
func upInMachine():
	tween = create_tween()
	tween.parallel().tween_property(machineBase, "position", machinePos, 1.5)
	tween.parallel().tween_property($"." , "global_position", posUp, 1.5)
	

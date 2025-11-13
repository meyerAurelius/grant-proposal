extends MeshInstance3D
var pos = Vector3(-0.135,1.774,-0.225)

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
	

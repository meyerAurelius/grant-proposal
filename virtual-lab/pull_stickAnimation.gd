extends CSGCylinder3D

var lowpos = Vector3(-0.098, 1.232 ,0.005)
var medpos = Vector3(-0.098, 1.289 ,0.005)
var highpos = Vector3(-0.098, 1.334 ,0.005)
var tween

	
func lowposAnimation():
	tween = create_tween()
	tween.tween_property($"." , "global_position", lowpos, 0.5)
	
func medposAnimation():
	tween = create_tween()
	tween.tween_property($".", "global_position", medpos, 0.5)
	
func highposAnimation():
	tween = create_tween()
	tween.tween_property($".", "global_position", highpos, 0.5)

extends CSGBox3D

var lowpos = Vector3(0, deg_to_rad(56) , 0)
var medpos = Vector3(0, 0 , 0)
var highpos = Vector3(0, deg_to_rad(-56) , 0)
var tween

	
func lowposAnimation():
	tween = create_tween()
	tween.tween_property($"." , "rotation", lowpos, 0.5)
	
func medposAnimation():
	tween = create_tween()
	tween.tween_property($".", "rotation", medpos, 0.5)
	
func highposAnimation():
	tween = create_tween()
	tween.tween_property($".", "rotation", highpos, 0.5)

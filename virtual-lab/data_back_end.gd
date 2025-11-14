extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

var reference_angle = 178.2 # our starting angle we need to subtract from

func _on_timer_timeout() -> void:
	Globals.angle = 178.2 - Globals.rpm/10
	$'../Viscometer/AngleReading/AngleReadingMesh'.rotation_degrees.y = Globals.angle 
	

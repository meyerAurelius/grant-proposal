extends Control
var on = false
var time = 0
@onready var label = $Label
@onready var animationP =  $AnimationPlayer
@onready var animationP2 = $Rotate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("toggle_stopwatch")):
		if (on):
			stop()
		else:
			start()
	if on:
		get_time()
	
	
func get_time():
	var current_time = Time.get_unix_time_from_system()
	var elapsed = int(current_time - time)
	var seconds = elapsed % 60
	var hours = elapsed / 3600
	var minutes = (elapsed - (hours*3600)) / 60
	var elapsed_time = "%02d:%02d:%02d" % [hours, minutes, seconds]
	label.text = elapsed_time

func start():
	time = Time.get_unix_time_from_system()
	animationP2.play("rotatehand")
	animationP.play("pressClock")
	on = true
	
	
func stop():
	animationP.play("RESET")
	animationP2.play("RESET")
	on = false
	

func _on_toggle_pressed() -> void:
	if (on):
		stop()
	else:
		start()

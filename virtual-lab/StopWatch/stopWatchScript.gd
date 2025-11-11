extends Control
var on = false
var time = 0
var paused_time = 0
@onready var label = $Label
@onready var animationP =  $AnimationPlayer
@onready var animationP2 = $Rotate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("toggle_stopwatch")):
		if (on):
			stop()
		else:
			start()
			
	if Input.is_action_just_pressed("reset_stopwatch"):
		reset()
	
	if on:
		get_time()
	
	
func get_time():
	var current_time = Time.get_unix_time_from_system()
	var elapsed = int((current_time - time) + paused_time)
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
	var current_time = Time.get_unix_time_from_system()
	paused_time += current_time - time
	on = false
	animationP.play("RESET")
	animationP2.stop()
	
	

func reset():
	on = 0
	paused_time = 0
	time = 0
	animationP.play("RESET")
	animationP2.play("RESET")
	label.text = "00:00:00"

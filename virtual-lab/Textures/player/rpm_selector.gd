extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@export var selected_rpm = 0

# RPM Selector UI
# 	For this, we just listen to the signals from each button
# 	and transform the arrow to the corresponding location
@onready var control_arrow = $'./ControlArrow'
@onready var player = get_node("../../Player")
@onready var leverAnimation = get_node("../../Mesh/Lever Base/LeverAnimation")



func _on_rpm_0_pressed() -> void:
	control_arrow.position = Vector2(70, 93)
	selected_rpm = 0
	leverAnimation.play("LeverLow")
	
func _on_rpm_100_pressed() -> void:
	control_arrow.position = Vector2(170, 93)
	selected_rpm = 100


func _on_rpm_200_pressed() -> void:
	control_arrow.position = Vector2(321, 93)
	selected_rpm = 200
	leverAnimation.play("RESET")

func _on_rpm_300_pressed() -> void:
	control_arrow.position = Vector2(452, 93)
	selected_rpm = 300

func _on_rpm_600_pressed() -> void:
	control_arrow.position = Vector2(607, 93)
	selected_rpm = 600
	leverAnimation.play("LeverHigh")

func setRPM(rpm):
	selected_rpm = rpm
	print(selected_rpm)


func _on_button_pressed() -> void:
	$'.'.visible = false
	player.moveCameraBack()

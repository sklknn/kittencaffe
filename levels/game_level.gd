extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("res://timelines/ingame.dtl")
	Dialogic.signal_event.connect(DialogicSignal)

func _process(delta: float) -> void:
	$AudioStreamPlayer2D.global_position = $Miniko.global_position

func DialogicSignal(argument: String):
	if argument == "tutor_end":
		print("tutor ends!")
		$AudioStreamPlayer2D.play()

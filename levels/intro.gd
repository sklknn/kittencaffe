extends Node2D

var cam_move: float = 1.0

func _ready() -> void:
	Dialogic.start("res://timelines/timeline.dtl")
	Dialogic.signal_event.connect(DialogicSignal)


func DialogicSignal(argument: String):
	if argument == "intro_ends":
		get_tree().change_scene_to_file("res://levels/game_level.tscn")

func _process(delta: float) -> void:
	cam_move -= delta
	if cam_move >= 0 :
		if $Camera2D.global_position.y < 200:
			$Camera2D.global_position.y += 1
	else:
		cam_move = 1.0

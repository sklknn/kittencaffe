extends Node2D

@export var progress_needed = 100
var progress = 0 
signal coffee_done
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += Input.get_action_strength("MiniGamesAction")
	$progress.scale.x = progress/progress_needed
	$progress.position.y = 25 - (progress/progress_needed)*25 
	if progress >= progress_needed :
		emit_signal("coffee_done")

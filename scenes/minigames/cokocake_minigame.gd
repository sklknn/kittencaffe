extends Node2D

@export var needed_shakes = 20
var shackes = 0

signal cococake_done

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if needed_shakes == shackes:
		emit_signal("cococake_done")


func _on_area_2d_mouse_entered() -> void:
	shackes += 1


func _on_area_2d_2_mouse_entered() -> void:
	shackes += 1

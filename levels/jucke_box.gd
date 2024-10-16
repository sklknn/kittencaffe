extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	print("interacted w " + self.name)
	$"../AudioStreamPlayer2D".stop()
	$"../AudioStreamPlayer2D".play()

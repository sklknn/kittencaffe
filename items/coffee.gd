extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea

signal take_cake

var food_type = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	emit_signal("take_cake")

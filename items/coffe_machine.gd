extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
# Called when the node enters the scene tree for the first time.

var coffee = preload("res://items/coffee.tscn")
var coffee_instance = coffee.instantiate()

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	print("interacted w " + self.name)
	if get_node("Coffee") == null :
		$Timer.start(5)
		$AudioStreamPlayer2D.play()


func _on_timer_timeout() -> void:
	$AudioStreamPlayer2D.stop()
	add_child(coffee_instance)
	coffee_instance.global_position = self.global_position
	coffee_instance.global_position.y += 15

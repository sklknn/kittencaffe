extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
# Called when the node enters the scene tree for the first time.

var coffee = preload("res://items/coffee.tscn")
var coffee_instance 
var coffee_minigame = preload("res://scenes/minigames/coffe_minigame.tscn")
var coffe_minigame_instance 

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	print("interacted w " + self.name)
	if get_node("Coffee") == null :
		coffe_minigame_instance = coffee_minigame.instantiate()
		add_child(coffe_minigame_instance)
		coffe_minigame_instance.connect("coffee_done",coffee_done)
		coffe_minigame_instance.global_position = self.global_position
		coffe_minigame_instance.global_position.y += 15
		$AudioStreamPlayer2D.play()
		$"../Miniko".move_speed = 0
		



func coffee_done() -> void:
	$AudioStreamPlayer2D.stop()
	coffe_minigame_instance.queue_free()
	print("coffee done!")
	$"../Miniko".move_speed = 100
	coffee_instance = coffee.instantiate()
	add_child(coffee_instance)
	coffee_instance.global_position = self.global_position
	coffee_instance.global_position.y += 15
	coffee_instance.connect("take_coffe",take_coffee)

func take_coffee():
	$"../Miniko".item_coffe += 1
	coffee_instance.queue_free()
	print($"../Miniko".item_coffe)

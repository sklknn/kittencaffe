extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea

var cokocake = preload("res://scenes/minigames/cokocake_minigame.tscn")
var cohocake_instance

var cake = preload("res://items/choco_cake.tscn")
var cake_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	cohocake_instance = cokocake.instantiate()
	add_child(cohocake_instance)
	cohocake_instance.connect("cococake_done",cococake_done)
	cohocake_instance.global_position = self.global_position
	cohocake_instance.global_position.y += 15
	
func cococake_done():
	cohocake_instance.queue_free()
	cake_instance = cake.instantiate()
	cake_instance.global_position = self.global_position
	cake_instance.global_position.y += 15
	cake_instance.connect("take_cake",take_cake)
	print("cake is here!")

func take_cake():
	$"../Miniko".item_cokocake += 1
	cake_instance.queue_free()
	print($"../Miniko".item_coffe)

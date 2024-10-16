extends CharacterBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@export var food_type = 0

var ready_to_interact = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("popup")
	$FoodSprite.frame = food_type
	interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	if ready_to_interact: 
		print("interacted w " + self.name)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "popup":
		ready_to_interact = true

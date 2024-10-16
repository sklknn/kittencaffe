extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : int = 1
#parameters/idle/blend_position

@onready var animation_tree = $AnimationTree
@onready var state_macine = animation_tree.get("parameters/playback")

func _ready() -> void:
	update_animation_parameters(Vector2(starting_direction,0))

func _physics_process(_delta: float):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	#print(input_direction)
	
	update_animation_parameters(input_direction)
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	
	pick_new_state()
	
func update_animation_parameters(move_input: Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/idle/blend_position",move_input.x)
		animation_tree.set("parameters/walk/blend_position",move_input.x)

func pick_new_state():
	if (velocity != Vector2.ZERO):
		state_macine.travel("walk")
	else:
		state_macine.travel("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Miniko":
		print(body.name)
		$"../rain".play()
	

extends CharacterBody2D

@onready var anim_player = $AnimationPlayer

var rng = RandomNumberGenerator.new()

var move_dir = Vector2(rng.randi_range(-1,1),rng.randi_range(-1,1))

@export var movement_timer: float = 5.0
@export var movement_time: float = 1.0
@export var speed = 10

func _ready() -> void:
	anim_player.current_animation = "idle"

func _process(delta: float) -> void:
	movement_timer -= delta
	play_anim()
	if movement_timer <= 0 :
		if movement_time > 0:
			movement_time -= delta
			velocity = move_dir * speed
			move_and_slide()
		else :
			movement_time = rng.randf_range(0,3)
			movement_timer = 5.0
			move_dir = Vector2(rng.randi_range(-1,1),rng.randi_range(-1,1))
			play_anim()

func play_anim():
	if (velocity.x == 0 or velocity.y == 0):
		anim_player.current_animation = "idle"
	if velocity.x > 0 :
		$Sprite2D.flip_h = false
		anim_player.current_animation = "walk"
	if velocity.x < 0 :
		$Sprite2D.flip_h = true
		anim_player.current_animation = "walk"

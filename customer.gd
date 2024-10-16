extends CharacterBody2D

#black_cat_textures
var black_back = preload("res://art/Neko Cafe Asset Pack/Characters/cat-black-back.png")
var black_front = preload("res://art/Neko Cafe Asset Pack/Characters/cat-black-front.png")
var black_side = preload("res://art/Neko Cafe Asset Pack/Characters/cat-black-side.png")
#orange
var orange_back = preload("res://art/Neko Cafe Asset Pack/Characters/cat-orange-back.png")
var orange_front = preload("res://art/Neko Cafe Asset Pack/Characters/cat-orange-front.png")
var orange_side = preload("res://art/Neko Cafe Asset Pack/Characters/cat-orange-side.png")
#waiter
var waiter_back = preload("res://art/Neko Cafe Asset Pack/Characters/cat-waiter-back.png")
var waiter_front = preload("res://art/Neko Cafe Asset Pack/Characters/cat-waiter-front.png")
var waiter_side = preload("res://art/Neko Cafe Asset Pack/Characters/cat-waiter-side.png")

enum {black,orange,waiter}

var cat_type

var move_cooldown = 10

@export var speed = 10
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cat_type = randi_range(black,waiter)
	cat_anim()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if move_cooldown >=5 :
		velocity = direction * speed
		move_and_slide()
		cat_anim()
		move_cooldown -= delta
	if move_cooldown < 0 :
		direction = Vector2(randi_range(-1,1),randi_range(-1,1))
		move_cooldown = 10

func cat_anim():
	if cat_type == black:
		if velocity == Vector2.ZERO:
			$Sprite2D.texture = black_front
			$AnimationPlayer.play("idle")
			$Sprite2D.flip_h = false
		if velocity.x > 0.5 && velocity.y < 0.5 && velocity.y > -0.5 :
			$Sprite2D.texture = black_side
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
		if velocity.x < -0.5 && velocity.y < 0.5 && velocity.y > -0.5 :
			$Sprite2D.texture = black_side
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = true
		if velocity.y > 0.5 && velocity.x < 0.5 && velocity.x > -0.5 :
			$Sprite2D.texture = black_back
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
		if velocity.y < -0.5 && velocity.x < 0.5 && velocity.x > -0.5 :
			$Sprite2D.texture = black_front
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
	if cat_type == orange:
		if velocity == Vector2.ZERO:
			$Sprite2D.texture = orange_front
			$AnimationPlayer.play("idle")
			$Sprite2D.flip_h = false
		if velocity.x > 0.5 && velocity.y < 0.5 && velocity.y > -0.5 :
			$Sprite2D.texture = orange_side
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
		if velocity.x < -0.5 && velocity.y < 0.5 && velocity.y > -0.5 :
			$Sprite2D.texture = orange_side
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = true
		if velocity.y > 0.5 && velocity.x < 0.5 && velocity.x > -0.5 :
			$Sprite2D.texture = orange_back
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
		if velocity.y < -0.5 && velocity.x < 0.5 && velocity.x > -0.5 :
			$Sprite2D.texture = orange_front
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
	if cat_type == waiter:
		if velocity == Vector2.ZERO:
			$Sprite2D.texture = waiter_front
			$AnimationPlayer.play("idle")
			$Sprite2D.flip_h = false
		if velocity.x > 0.5 && velocity.y < 0.5 && velocity.y > -0.5 :
			$Sprite2D.texture = waiter_side
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
		if velocity.x < -0.5 && velocity.y < 0.5 && velocity.y > -0.5 :
			$Sprite2D.texture = waiter_side
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = true
		if velocity.y > 0.5 && velocity.x < 0.5 && velocity.x > -0.5 :
			$Sprite2D.texture = waiter_back
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false
		if velocity.y < -0.5 && velocity.x < 0.5 && velocity.x > -0.5 :
			$Sprite2D.texture = waiter_front
			$AnimationPlayer.play("walk")
			$Sprite2D.flip_h = false

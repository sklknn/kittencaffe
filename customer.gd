extends CharacterBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = get_tree().get_first_node_in_group("player")

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

@export var move_cooldown = 5
@export var move_time = 5
var movement_cooldown = move_cooldown + move_time

@export var speed = 10
var direction = Vector2(0,0)

var wanted_food

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cat_type = randi_range(black,waiter)
	cat_anim()
	$Thinking.visible = false
	$Timer.start(randf_range(3,8))
	$Thinking/Food.frame = randi_range(0,5)
	wanted_food = $Thinking/Food.frame
	interaction_area.interact = Callable(self, "_on_interact")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cat_anim()
	movement_cooldown -= delta
	if movement_cooldown >= move_time :
		velocity = direction * speed
		move_and_slide()
		
		
	if movement_cooldown <= 0 :
		direction = Vector2(randi_range(-1,1),randi_range(-1,1))
		movement_cooldown = move_cooldown + move_time

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


func _on_timer_timeout() -> void:
	$Thinking.visible = true
	$Thinking/AnimationPlayer.play("idle")

func _on_interact():
	if $Thinking.visible:
		match wanted_food:
			0:
				if player.item_cokocake > 0:
					player.item_cokocake -= 1
					self.queue_free()
			1:
				if player.item_coffe > 0:
					player.item_coffe -= 1
					self.queue_free()
			2:
				if player.item_shit > 0:
					player.item_shit -= 1
					self.queue_free()
			3:
				if player.item_berrycake  > 0:
					player.item_berrycake  -= 1
					self.queue_free()
			4:
				if player.item_quasant  > 0:
					player.item_quasant  -= 1
					self.queue_free()
			5:
				if player.item_toast  > 0:
					player.item_toast  -= 1
					self.queue_free()

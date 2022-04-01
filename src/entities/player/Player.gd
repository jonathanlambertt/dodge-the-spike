extends KinematicBody2D

var velocity = Vector2(0, 0)
var screen_size
var score = 0
onready var player_sprite = get_node("Sprite")

const SPEED = 460

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(45, screen_size.y / 2)

func _physics_process(_delta):
	player_move()
	move_and_slide(velocity)

func player_move():
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
	else:
		velocity.y = 0
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		player_sprite.flip_h = true
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		player_sprite.flip_h = false
	else:
		velocity.x = 0

func increase_score():
	score += 1
	

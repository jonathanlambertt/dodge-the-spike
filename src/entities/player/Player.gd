extends KinematicBody2D

signal score_reached

const SPEED = 465

var velocity = Vector2(0, 0)
var screen_size
var score = 0
var _effect_score = 5
onready var player_sprite = get_node("Sprite")

func _ready():
    screen_size = get_viewport_rect().size
    position = Vector2(45, screen_size.y / 2)

func _physics_process(_delta):
    player_move()
    var _velocity = move_and_slide(velocity)

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
    get_node("/root/Global").score = score
    check_score()

func check_score():
    if (score >= _effect_score) && (score % _effect_score == 0):
        emit_signal("score_reached")
    

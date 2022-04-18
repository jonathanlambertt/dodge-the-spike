extends KinematicBody2D

var velocity = Vector2(0, 0)
var screen_size

const SPEED = 650

signal game_over

func _ready():
    screen_size = get_viewport_rect().size
    position = Vector2(screen_size.x / 2, screen_size.y / 2)

func _physics_process(delta):
    var collision = move_and_collide(velocity * delta * SPEED)
    if collision:
        velocity = velocity.bounce(collision.normal)
        if collision.collider.name == "Player":
            emit_signal("game_over")

func set_random_direction():
    randomize()
    var rand_x = [1, -1][randi() % 2]
    var rand_y = [1, -1][randi() % 2]
    velocity = Vector2(rand_x, rand_y)

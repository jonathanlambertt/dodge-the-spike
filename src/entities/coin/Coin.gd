extends Area2D

signal collected

var random = RandomNumberGenerator.new()
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x - 50, screen_size.y / 2)

func _on_Coin_body_entered(body):
	if body.name == "Player":
		collect()

func set_random_position():
	random.randomize()
	var rand_x = random.randi_range(20, screen_size.x - 20)
	var rand_y = random.randi_range(20, screen_size.y - 20)
	position = Vector2(rand_x, rand_y)

func collect():
	emit_signal("collected")
	set_random_position()

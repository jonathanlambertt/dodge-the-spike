extends Node2D

onready var enemy = get_node("Enemy")
onready var hud = get_node("HUD")
onready var player = get_node("Player")

func _on_EnemyWait_timeout():
    hud.hide_ready_text()
    enemy.set_random_direction()

func _on_Coin_collected():
    player.increase_score()
    hud.update_score(player.score)

# run enemy effect when player score reaches a certain effect score
func _on_Player_score_reached():
    enemy.set_random_direction()

func _on_Enemy_game_over():
    get_node("/root/Global").score = player.score
    get_tree().change_scene("res://src/menus/GameOver.tscn")

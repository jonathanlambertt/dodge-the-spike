extends Control

onready var score_label = get_node("CenterContainer/VBoxContainer/Score")

func _ready():
    score_label.text = str(get_node("/root/Global").score)

func _on_Button_pressed():
    get_tree().change_scene("res://src/Game.tscn")


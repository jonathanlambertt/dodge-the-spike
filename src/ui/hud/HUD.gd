extends Control

onready var score_label = get_node("Score")
onready var ready_label = get_node("Ready")

func update_score(score):
    score_label.text = str(score)

func hide_ready_text():
    ready_label.hide()

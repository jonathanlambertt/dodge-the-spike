extends Control

func update_score(score):
	get_node("Score").text = str(score)

func hide_ready_text():
	get_node("Ready").hide()

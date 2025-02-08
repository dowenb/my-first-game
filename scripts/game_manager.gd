extends Node

var score = 0
@onready var score_label: Label = $ScoreLabel
@onready var hud_score_label: Label = $"../HeadsUpDisplay/Panel/HudScoreLabel"

func add_point():
	score += 1
	score_label.text = "You coillected " + str(score) + " coins."
	hud_score_label.text = str(score)

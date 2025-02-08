extends Node

var score = 0
var lives = 3

func add_point():
	score += 1

func lose_life():
	lives -= 1

func reset_lives_and_score():
	score = 0
	lives = 3

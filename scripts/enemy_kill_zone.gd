extends Area2D

@onready var timer: Timer = $Timer
@onready var death: AudioStreamPlayer2D = $Death
@onready var player: CharacterBody2D = %Player

func _on_body_entered(body: Node2D) -> void:
	if body.visible == true:		body.visible = false
		GameManager.lose_life() 
		death.play()
		Engine.time_scale = 0.5
		timer.start()
	else:
		pass

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	
	# Check if lives reached 0
	if GameManager.lives <= 0:
		# Restart game
		get_tree().reload_current_scene()
		GameManager.reset_lives_and_score()
	else:
		# Reset charecter without restarting game
		player.reset_player()
		

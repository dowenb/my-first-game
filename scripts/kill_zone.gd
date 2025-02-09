extends Area2D

@onready var timer: Timer = $Timer
@onready var death: AudioStreamPlayer2D = $Death
@onready var player: CharacterBody2D = %Player

func _on_body_entered(body: Node2D) -> void:
	if body.visible == true:
		GameManager.allow_input = false
		body.visible = false
		GameManager.lose_life() 
		death.play()
		timer.start()
	else:
		pass

func _on_timer_timeout() -> void:
	player.reset_player()
		

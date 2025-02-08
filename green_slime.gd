extends Area2D

@export var move_speed = 30

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var death: AudioStreamPlayer2D = $Death
@onready var player: CharacterBody2D = %Player

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true

	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	position.x += direction * move_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.visible == true:
		body.visible = false
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
		

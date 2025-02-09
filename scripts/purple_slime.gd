extends Area2D

@export var move_speed = 40

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var purple_timer: Timer = $PurpleTimer
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
	if body.visible == true and body.is_in_group('player'):
		GameManager.allow_input = false
		body.visible = false
		GameManager.lose_life() 
		death.play()
		purple_timer.start()
	else:
		pass

func _on_purple_timer_timeout() -> void:
	player.reset_player()

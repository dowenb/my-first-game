extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var player: CharacterBody2D = %Player
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_over_timer: Timer = $GameOverTimer
@onready var game_over_label: Label = %GameOverLabel
@onready var game_over_sound: AudioStreamPlayer2D = $GameOverSound


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func reset_player():
		# Check if lives reached 0
	if GameManager.lives <= 0:
		# Restart game
		#player.position = Vector2(0, -300)
		game_over_sound.play()
		game_over_label.visible = true
		game_over_timer.start()
	else:
		# Reset charecter without restarting game
		player.position = Vector2(0, -32)
		player.visible = true


func _on_game_over_timer_timeout() -> void:
		game_over_label.visible = false
		get_tree().reload_current_scene()
		GameManager.reset_lives_and_score()

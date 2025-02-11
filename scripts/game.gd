extends Node2D

@onready var win_panel: Panel = %WinPanel
@onready var game_win_reset: Timer = $GameWinReset
@onready var player: CharacterBody2D = %Player
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $HeadsUpDisplay/WinPanel/AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.score == 23 and game_win_reset.is_stopped():
		GameManager.allow_input = false
		win_panel.visible = true
		audio_stream_player_2d.play()
		game_win_reset.start()

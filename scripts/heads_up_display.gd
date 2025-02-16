extends CanvasLayer

@onready var hud_score_label: Label = %HudScoreLabel
@onready var hud_health_label: Label = %HudHealthLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hud_health_label.text = str(GameManager.lives)
	hud_score_label.text = str(GameManager.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	hud_health_label.text = str(GameManager.lives)
	hud_score_label.text = str(GameManager.score)

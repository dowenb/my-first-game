extends AnimatableBody2D

@export var SPEED = 30

var direction = 1

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1

	if ray_cast_left.is_colliding():
		direction = 1

	position.x += direction * SPEED * delta

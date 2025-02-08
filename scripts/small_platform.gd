extends AnimatableBody2D

const SPEED = 30

var direction = 1

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		sprite_2d.flip_h = true

	if ray_cast_left.is_colliding():
		direction = 1
		sprite_2d.flip_h = false

	position.x += direction * SPEED * delta

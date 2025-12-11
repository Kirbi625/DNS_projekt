extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var t

func _physics_process(delta: float) -> void:
	t = delta * 0.4
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	$".".position = $".".position.lerp(Global.test, 0.033)
	move_and_slide()

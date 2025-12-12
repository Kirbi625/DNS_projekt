extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var speed = snapped(RandomNumberGenerator.new().randf_range(0.01, 0.033), 0.0001)


	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	$".".position = $".".position.lerp(Global.test, speed)
		

	move_and_slide()

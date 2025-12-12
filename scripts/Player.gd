extends CharacterBody2D

var can_attack = true
var counter = 0

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

func attack():
	
	if not can_attack:
		return
		
	can_attack = false
	
	#on/off hitbox
	$hitbox.set_deferred("monitoring", true)
	$hitbox.visible = true
	await get_tree().create_timer(0.2).timeout
	$hitbox.set_deferred("monitoring", false)
	$hitbox.visible = false
	
	# combo of 3
	counter+=1
	if counter == 3:
		await get_tree().create_timer(1).timeout	
		counter = 0

	can_attack = true
	print("amogus")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	# character rotation
	if direction != 0:
		$AnimatedSprite2D.flip_h = direction < 0
	
	# hitbox in front of player            
		$hitbox.position.x = direction * 175  # <-- diddstance 
		
	if Input.is_action_just_pressed("attack"):	
		attack()
		
	
	move_and_slide()
	

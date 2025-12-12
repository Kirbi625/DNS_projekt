extends Node2D


func _process(delta: float) -> void:
	var enemy_movement_vector : Vector2 = Vector2($"player".position.x,$"enemy".position.y)
	Global.test = enemy_movement_vector
	
	print("en_1: ", snapped($"enemy".speed, 0.0001) ," en_2: ", $"enemy2".speed)
	

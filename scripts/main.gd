extends Node2D


func _process(delta: float) -> void:
	var enemy_movement_vector : Vector2 = Vector2($"player".position.x,$"enemy".position.y)
	Global.test = enemy_movement_vector
	
		

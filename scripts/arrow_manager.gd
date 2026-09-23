extends Node2D

class_name ArrowManager

const ArrowScene = preload("res://scenes/arrow.tscn")

func _on_bow_shoot_arrow(muzzle_pos: Vector2, direction: float, power: float) -> void:
	var arrow: Arrow = ArrowScene.instantiate()
	arrow.global_position = muzzle_pos
	arrow.rotation = direction
	arrow.direction = Vector2.RIGHT.rotated(direction)
	arrow.power = power
	add_child(arrow)

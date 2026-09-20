extends Area2D

class_name AttackComponent

@export var physical_attack: float = 1

func _on_area_entered(area: Area2D) -> void:
	print("area", area)
	if area is HitboxComponent:
		var attack = Attack.new(physical_attack)
		area.damage(attack)

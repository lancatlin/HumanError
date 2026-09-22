extends Area2D

class_name AttackComponent

@export var physical_attack: float = 1
@export var character_class: Types.CharacterClass

func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent and area.character_class != character_class:
		var attack = Attack.new(physical_attack)
		area.damage(attack)

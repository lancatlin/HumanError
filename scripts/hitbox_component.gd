extends Area2D

class_name HitboxComponent

@export var health_component: HealthComponent
@export var character_class: Types.CharacterClass

func damage(attack: Attack):
	print("take damage", attack)
	if health_component:
		health_component.damage(attack)


func heal(healing: int) -> bool:
	if health_component:
		return health_component.heal(healing)
	
	return false

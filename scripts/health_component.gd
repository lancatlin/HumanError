extends Node2D

class_name HealthComponent

@export var MAX_HP = 10

var hp = MAX_HP

signal health_changed(current: int, change: int, max: int)
signal hurted  
signal died

func _ready() -> void:
	hp = MAX_HP

func damage(attack: Attack):
	
	hp -= attack.get_physical()
	
	hurted.emit()
	health_changed.emit(hp, -attack.get_physical(), MAX_HP)
	if hp <= 0:
		died.emit()
	
func reset():
	hp = MAX_HP
	health_changed.emit(hp, MAX_HP)



	

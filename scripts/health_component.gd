extends Node2D

class_name HealthComponent

@export var MAX_HP: float = 10.0

var hp: float = MAX_HP
var alive = true


signal health_changed(current: float, change: float, max: float)
signal hurted  
signal died

func _ready() -> void:
	hp = MAX_HP

func damage(attack: Attack):
	
	hp -= attack.get_physical()
	
	hurted.emit()
	health_changed.emit(hp, -attack.get_physical(), MAX_HP)
	if hp <= 0 and alive:
		alive = false
		died.emit()
	
func reset():
	hp = MAX_HP
	health_changed.emit(hp, MAX_HP)

func heal(healing: float) -> bool:
	if hp < MAX_HP:
		hp = min(hp + healing, MAX_HP)
		health_changed.emit(hp, healing, MAX_HP)
		return true
		
	return false

extends Node2D

class_name HealthComponent

@export var MAX_HP = 10

var hp = MAX_HP

signal health_changed(current: int, max: int)
signal died

func _ready() -> void:
	hp = MAX_HP

func damage(attack: Attack):
	print('received attack!')
	hp -= attack.get_physical()
	health_changed.emit(hp, MAX_HP)
	if hp <= 0:
		died.emit()
	

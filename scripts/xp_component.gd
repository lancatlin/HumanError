extends Node2D

class_name XPComponent

@export var xp: int = 1
@export var health_component: HealthComponent

signal add_xp(new_xp: int)

func _ready() -> void:
	health_component.connect("died", _on_died)

func _on_died() -> void:
	add_xp.emit(xp)

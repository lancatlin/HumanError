extends Node2D

class_name BossHealthBar

@export var health_component: HealthComponent
var hearts: Array[Heart]
const HeartScene = preload("res://scenes/heart.tscn")
var STEP = 15
@onready var color_rect: ColorRect = $ColorRect
@onready var name_label: Label = $Name
@onready var hp_label: Label = $HP

func _ready() -> void:
	hide()
	
func setup(hc: HealthComponent, boss_name: String):
	show()
	health_component = hc
	health_component.connect("health_changed", _on_health_changed)
	_show_hp(health_component.hp, health_component.MAX_HP)
	name_label.text = boss_name

func _on_health_changed(current: int, change: int, max: int) -> void:
	print("Health change!")
	_show_hp(current, max)
	

func _show_hp(current: int, max: int):
	var fraction = health_component.hp / health_component.MAX_HP
	color_rect.scale = Vector2(fraction, 1)
	hp_label.text = str(current)
	

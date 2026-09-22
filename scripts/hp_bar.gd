extends Node2D


@onready var player: CharacterBody2D = %Player
var health_component: HealthComponent
var hearts: Array[Heart]
const HeartScene = preload("res://scenes/heart.tscn")
var STEP = 15

func _ready() -> void:
	health_component = player.get_node("HealthComponent")
	health_component.connect("health_changed", _on_health_changed)
	
	hearts = []
	for i in range(health_component.MAX_HP):
		print(i)
		var node: Heart = HeartScene.instantiate()
		print(node)
		node.position.x = i * STEP
		node.position.y = 0
		add_child(node)
		hearts.append(node)
	print(get_child_count(), hearts)
	_show_hp(health_component.hp, health_component.MAX_HP)

func _on_health_changed(current: int, change: int, max: int) -> void:
	print("Health change!")
	_show_hp(current, max)
	

func _show_hp(current: int, max: int):
	for i in range(hearts.size()):
		if i < current:
			hearts[i].play("full")
		else:
			hearts[i].play("empty")

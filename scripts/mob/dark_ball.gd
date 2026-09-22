extends Node2D

const speed: float = 100

var direction: Vector2 = Vector2(0,0)

#physic update engin, 60 time / sec
func _physics_process(delta: float) -> void:
	position += direction * speed * delta

## anmation----------------------------
#
#@onready var ball_anime: AnimatedSprite2D = $AnimatedSprite2D
#
#func _ready() -> void:
	#ball_anime.play("default")


func _on_attack_component_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

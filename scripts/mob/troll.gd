extends CharacterBody2D

@onready var player: CharacterBody2D = %Player
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var reborn_timer: Timer = $RebornTimer
@onready var health_component: HealthComponent = $HealthComponent


const SPEED: int = 12
const SEARCH_DISTANCE: int = 150


func _process(delta: float):
	var diff: Vector2 = player.position - position
	if diff.length() < SEARCH_DISTANCE:
		position += diff.normalized() * SPEED * delta
		animated_sprite.flip_h = diff.x < 0
		animated_sprite.play("chase")
	else:
		animated_sprite.play("idle")


func _on_health_component_died() -> void:
	queue_free()


func _on_reborn_timer_timeout() -> void:
	pass

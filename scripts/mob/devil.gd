extends CharacterBody2D

class_name Devil

@export var player: Player
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var reborn_timer: Timer = $RebornTimer
@onready var health_component: HealthComponent = $HealthComponent


const SPEED: int = 100
const SEARCH_DISTANCE: int = 100


func _physics_process(delta: float):
	var diff: Vector2 = player.position - position  
	
	# fix 重叠,don't use position, use velocity
	if diff.length() < SEARCH_DISTANCE:
		velocity = diff.normalized() * SPEED
		move_and_slide()
		
		animated_sprite.flip_h = diff.x < 0
		animated_sprite.play("chase")
	else:
		
		velocity = Vector2.ZERO
		animated_sprite.play("idle")


func _on_health_component_died() -> void:
	await get_tree().create_timer(0.1).timeout # wait after damage
	animated_sprite.modulate = Color.BLACK
	await get_tree().create_timer(0.5).timeout
	queue_free()


func _on_reborn_timer_timeout() -> void:
	pass

#-------------hurt------------
func _on_health_component_hurted() -> void:
	animated_sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	animated_sprite.modulate = Color.WHITE

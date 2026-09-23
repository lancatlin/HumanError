extends Area2D

class_name Arrow

@export var direction: Vector2
@export var power: float
@onready var timer: Timer = $Timer
@onready var arrow_sprite: Sprite2D = $ArrowSprite
@onready var attack_component: AttackComponent = $AttackComponent

var SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow_sprite.scale = Vector2(sqrt(power), sqrt(power))
	attack_component.physical_attack = power
	SPEED *= sqrt(power)
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * SPEED * delta


func destroy() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	destroy()


func _on_body_entered(body: Node2D) -> void:
	destroy()

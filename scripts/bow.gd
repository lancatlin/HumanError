extends Node2D

class_name Bow

var direction = 1
const angular_speed = 5
const hold_speed = 2
var hold: bool = false
var power = 1

signal shoot_arrow(muzzle_pos: Vector2, direction: float, power: float)

@onready var muzzle: Node2D = $Muzzle
@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var timer: Timer = $Timer
@onready var arrow_sprite: Sprite2D = $ArrowSprite

const ACCUMULATE_SPEED: float = 1   # increase 0.5 power per second
const MAX_POWER: float = 3.0

func _ready() -> void:
	arrow_sprite.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hold:
		rotation += direction * hold_speed * delta
		power = min(power + ACCUMULATE_SPEED * delta, MAX_POWER)
		arrow_sprite.scale = Vector2(sqrt(power), sqrt(power))
	else:
		rotation += direction * angular_speed * delta
	

func _input(event: InputEvent) -> void:  
	if event.is_action_pressed("fire"):
		hold = true
		sprite.play("hold")
		direction *= -1
		timer.start()
		arrow_sprite.show()
		power = 1
		
	elif event.is_action_released("fire"):
		hold = false
		sprite.play("idle")
		arrow_sprite.hide()
		shoot_arrow.emit(muzzle.global_position, rotation, power)


func _on_timer_timeout() -> void:
	if hold:
		direction *= -1

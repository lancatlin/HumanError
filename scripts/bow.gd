extends Node2D

class_name Bow

var direction = 1
const angular_speed = 5
const hold_speed = 2
var hold: bool = false

signal shoot_arrow(muzzle_pos: Vector2, direction: float)

@onready var muzzle: Node2D = $Muzzle
@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var timer: Timer = $Timer
@onready var arrow_sprite: Sprite2D = $ArrowSprite


func _ready() -> void:
	arrow_sprite.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hold:
		rotation += direction * hold_speed * delta
	else:
		rotation += direction * angular_speed * delta
	

func _input(event: InputEvent) -> void:  
	if event.is_action_pressed("fire"):
		hold = true
		sprite.play("hold")
		direction *= -1
		timer.start()
		arrow_sprite.show()
		
	elif event.is_action_released("fire"):
		hold = false
		sprite.play("idle")
		arrow_sprite.hide()
		shoot_arrow.emit(muzzle.global_position, rotation)


func _on_timer_timeout() -> void:
	if hold:
		direction *= -1

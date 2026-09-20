extends Node2D

class_name Bow

var direction = 1
const angular_speed = 5

signal shoot_arrow(muzzle_pos: Vector2, direction: float)

@onready var muzzle: Node2D = $Muzzle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += direction * angular_speed * delta



func _input(event: InputEvent) -> void:  
	if event.is_action_pressed("fire"):
		direction *= -1		
		shoot_arrow.emit(muzzle.global_position, rotation)

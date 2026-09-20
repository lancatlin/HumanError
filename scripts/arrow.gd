extends Area2D

class_name Arrow

@export var direction: Vector2
@onready var timer: Timer = $Timer


const SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * SPEED * delta


func destroy() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	print("timeout")
	destroy()

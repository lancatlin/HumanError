extends Area2D

class_name Arrow

@export var direction: Vector2

const SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	destroy()
	

func destroy() -> void:
	queue_free()

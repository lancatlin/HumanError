extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var y_direction := Input.get_axis("move_up", "move_down")
	var x_direction := Input.get_axis("move_left", "move_right")
	if x_direction:
		velocity.x = x_direction * SPEED
		animated_sprite_2d.flip_h = x_direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if x_direction or y_direction:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")

	move_and_slide()


func _on_health_component_died() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	


func _on_health_component_health_changed(current: int, changed: int, max: int) -> void:
	if changed < 0:
		pass
	print("HP: %d/%d" % [current, max])

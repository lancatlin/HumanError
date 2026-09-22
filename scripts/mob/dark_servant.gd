extends CharacterBody2D

@onready var player: CharacterBody2D = %Player
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var reborn_timer: Timer = $RebornTimer
@onready var health_component: HealthComponent = $HealthComponent


#---------load dark ball--------------
@onready var shoot_timer:Timer = $shot_timer  # timer
const  dark_ball = preload("res://MOB/dark_ball.tscn")
#------------------------------------------

const SPEED: int = -13
const SEARCH_DISTANCE: int = 150


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

#-------------------- hurted animation-------------------------
func _on_health_component_hurted() -> void:
	animated_sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	animated_sprite.modulate = Color.WHITE

#-------------shot_dark_ball----------------------------

func _on_shot_timer_timeout() -> void:
	var ball_player_diff: Vector2 = player.global_position - global_position
	
	# shot distence
	if ball_player_diff.length() > SEARCH_DISTANCE:
		return
		
	var ball = dark_ball.instantiate()
	
	ball.global_position = global_position
	
	ball.direction = ball_player_diff.normalized()
	
	get_tree().current_scene.add_child(ball)
	
	
	
	

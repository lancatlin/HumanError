extends Control

#@export var duration: float = 5.0
#
#func _ready() -> void:
	#await get_tree().create_timer(duration).timeout
	#get_tree().change_scene_to_file("res://scenes/game.tscn")




func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

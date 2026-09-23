extends Node2D

var done: bool = false

func _on_audio_stream_player_finished() -> void:
	_go_to_main_menu()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		#_go_to_main_menu()
		pass
		
		
func _go_to_main_menu() -> void:
	if !done:
		done = true
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

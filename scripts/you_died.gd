extends Control

const MAIN_MENU := "res://scenes/main_menu.tscn"

@onready var label: Label = $CenterContainer/Label

var done := false


func _ready() -> void:
	label.modulate.a = 0.0
	var tween := create_tween()
	tween.tween_property(label, "modulate:a", 1.0, 1.5)
	tween.tween_interval(2.0)
	#tween.tween_callback(_go_to_main_menu)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		_go_to_main_menu()


func _go_to_main_menu() -> void:
	if done:
		return
	done = true
	get_tree().change_scene_to_file(MAIN_MENU)


func _on_audio_stream_player_2d_finished() -> void:
	_go_to_main_menu()

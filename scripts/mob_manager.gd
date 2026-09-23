extends Node2D

class_name MobManager
@onready var xp_manager: XPManager = %XPManager

func _ready() -> void:
	for child in get_children():
		var xp_component = child.get_node("XPComponent")
		if xp_component:
			xp_component.connect("add_xp", xp_manager.add_xp)

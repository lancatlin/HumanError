extends Node2D

class_name XPManager

var xp: int = 0

signal xp_changed(xp: int, change: int)

@onready var rich_text_label: RichTextLabel = $RichTextLabel


func add_xp(new_xp: int):
	xp += new_xp
	xp_changed.emit(xp, new_xp)
	
	rich_text_label.text = "XP %d" % xp

extends Area2D


@export var healing: int = 1


func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent and area.character_class == Types.CharacterClass.Player:
		area.heal(healing)
		queue_free()

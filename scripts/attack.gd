extends Object

class_name Attack

var physical: float = 0

func _init(physical_damage: float) -> void:
	physical = physical_damage
	
func get_physical() -> float:
	return physical

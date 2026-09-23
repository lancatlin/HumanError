extends Node2D

class_name CollectibleManager

const PotionScene: PackedScene = preload("res://scenes/potion.tscn")

const settings: Dictionary[PackedScene, float] = {
	PotionScene: 10, 		# generate one every 10 seconds
}

func _ready():
	for scene in settings:
		var create_node = func ():
			var node = scene.instantiate()
			node.position.x = randi_range(10, 500)
			node.position.y = randi_range(10, 350)
			add_child(node)
			print("new node", node.position)
			
		var timer = Timer.new()
		timer.set_wait_time(settings[scene])
		timer.set_one_shot(false)
		timer.connect("timeout", create_node)
		add_child(timer)
		timer.start()
		print(timer)
		
	

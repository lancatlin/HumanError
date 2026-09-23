extends Node2D

class_name MobManager
@onready var xp_manager: XPManager = %XPManager
@onready var player: Player = %Player
@onready var boss_health_bar: BossHealthBar = %BossHealthBar


var level = 0

var mob_count: int = 0

signal change_level(level: int)
signal victory


const ZombieScene: PackedScene = preload("res://MOB/zombie.tscn")
const TrollScene: PackedScene = preload("res://MOB/troll.tscn")
const DevilScene: PackedScene = preload("res://MOB/devil.tscn")
const DarkServantScene: PackedScene = preload("res://MOB/dark_servant.tscn")
const DarkWizardScene: PackedScene = preload("res://boss/dark_wizerd.tscn")

const WIDTH = 500
const HEIGHT = 350

const levels: Array = [
	{
		ZombieScene: 6,
		TrollScene: 4,
	},
	{
		TrollScene: 4,
		DevilScene: 2,
		DarkServantScene: 2,
	},
	{
		ZombieScene: 4,
		TrollScene: 3,
		DevilScene: 3,
		DarkServantScene: 3,
	},
	{
		# empty, only generates Boss
		DarkServantScene: 2
	}
]

func _ready() -> void:
	#boss_health_bar.hide()
	spawn_level()


func _on_mob_died(xp: int):
	mob_count -= 1
	xp_manager.add_xp(xp)
	print("Remain:", mob_count)
	if mob_count == 0:
		level += 1
		if level >= levels.size():
			# Win!
			victory.emit()
			get_tree().change_scene_to_file("res://scenes/victory_scene.tscn")
		else:
			change_level.emit(level)
			spawn_level()

func spawn_level():
	for scene in levels[level]:
		for i in range(levels[level][scene]):
			var mob: Node2D = scene.instantiate()
			mob.global_position.x = randi_range(10, WIDTH)
			mob.global_position.y = randi_range(10, HEIGHT)
			mob.player = player
			mob.get_node("XPComponent").connect("add_xp", _on_mob_died)
			add_child(mob)
			mob_count += 1
	if level == levels.size() - 1:
		# Spawn Boss
		var boss = DarkWizardScene.instantiate()
		boss.global_position.x = 20
		boss.global_position.y = 170
		boss.player = player
		boss.get_node("XPComponent").connect("add_xp", _on_mob_died)
		add_child(boss)
		mob_count += 1
		boss_health_bar.setup(boss.get_node("HealthComponent"), "Dark Wizard")

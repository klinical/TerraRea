extends Node2D

const MELEE_ENEMY = preload("res://melee_enemy/MeleeEnemy.tscn")

var spawn_radius: int = 200
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func spawn_mob(amount: int, target: Player) -> void:
	for n in amount:
		var mob = MELEE_ENEMY.instance()
		get_parent().add_child(mob)
		mob.position = position
		mob.target = target
		mob.get_node("StateMachine").transition_to("Chase")
		
		mob.position.x += rng.randf_range(-spawn_radius, spawn_radius)

class_name RangedEnemyState
extends State

var ranged_enemy: RangedEnemy

func _ready() -> void:
	yield(owner, "ready")
	ranged_enemy = owner as RangedEnemy
	assert(ranged_enemy != null)

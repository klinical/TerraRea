class_name MeleeEnemyState
extends State

var meleeEnemy: MeleeEnemy

func _ready() -> void:
	yield(owner, "ready")
	meleeEnemy = owner as MeleeEnemy
	assert(meleeEnemy != null)

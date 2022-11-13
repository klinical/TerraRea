extends RangedEnemyState

func physics_update(delta: float) -> void:
	if ranged_enemy.target != null:
		state_machine.transition_to("Firing")

extends MeleeEnemyState

func enter(msg: Dictionary = {}) -> void:
	meleeEnemy.get_node("AnimationPlayer").play("damaged")
	var damage_direction = msg.get("direction")
	meleeEnemy.velocity.x = damage_direction.x * 500 
	meleeEnemy.velocity.y = damage_direction.y * 500

func physics_update(delta: float) -> void:
	if meleeEnemy.is_on_floor():
		state_machine.transition_to("Chase")

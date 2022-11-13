extends PlayerState

func enter(msg: Dictionary = {}) -> void:
	player.animation_player.play("damaged")
	var damage_direction = msg.get("direction")
	player.velocity.x = damage_direction.x * 500 
	player.velocity.y = damage_direction.y * 500

func physics_update(delta: float) -> void:
	if player.is_on_floor():
		state_machine.transition_to("Idle")

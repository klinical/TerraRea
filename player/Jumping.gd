extends PlayerState

func enter(_msg: Dictionary = {}) -> void:
	var animationPlayer: AnimationPlayer = player.animation_player
	animationPlayer.play("jump")
	
	player.velocity.y = player.jump_speed
	
	var direction: String
	if player.velocity.x > 0:
		direction = "left"
	if player.velocity.x < 0:
		direction = "right"
	if player.velocity.x == 0:
		state_machine.transition_to("Idle")
		return
		
	state_machine.transition_to("Walking", {"direction": direction})

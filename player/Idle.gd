extends PlayerState

func enter(_msg := {}) -> void:
	#$AnimationPlayer.play("idle")
	pass

func physics_update(delta) -> void:
	player.velocity.x = 0
	if Input.is_action_pressed("right"):
		state_machine.transition_to("Walking", {"direction": "right"})
	if Input.is_action_pressed("left"):
		state_machine.transition_to("Walking", {"direction": "left"})

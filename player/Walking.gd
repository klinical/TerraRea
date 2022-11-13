extends PlayerState

func enter(msg := {}) -> void:
	#$AnimationPlayer.play("idle")
	var direction = msg.get("direction")
	
	if direction == "left":
		player.velocity.x = -player.run_speed
	else:
		player.velocity.x = player.run_speed

func physics_update(delta) -> void:
	player.velocity.x = 0
	var got_input = false
	
	if Input.is_action_pressed("left"):
		got_input = true
		player.velocity.x = -player.run_speed
	if Input.is_action_pressed("right"):
		got_input = true
		player.velocity.x = player.run_speed
	
	player.get_node("Sprite").flip_h = player.velocity.x < 0
		
	if got_input == false:
		state_machine.transition_to("Idle")

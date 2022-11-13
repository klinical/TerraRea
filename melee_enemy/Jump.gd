extends MeleeEnemyState

var jump_speed = -350
	
func enter(_msg: Dictionary = {}) -> void:
	var animationPlayer: AnimationPlayer = meleeEnemy.get_node("AnimationPlayer")
	animationPlayer.play("jump")
	
	meleeEnemy.velocity.y = jump_speed
	state_machine.transition_to("Chase")


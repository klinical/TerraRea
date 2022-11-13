extends MeleeEnemyState

func enter(_msg: Dictionary = {}) -> void:
	var animationPlayer: AnimationPlayer = meleeEnemy.get_node("AnimationPlayer")
	
	animationPlayer.connect("animation_finished", self, "next_step")
	animationPlayer.play("prepare_jump")

func next_step(name: String) -> void:
	var animationPlayer: AnimationPlayer = meleeEnemy.get_node("AnimationPlayer")
	
	animationPlayer.disconnect("animation_finished", self, "next_step")
	state_machine.transition_to("Jump")

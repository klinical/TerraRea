extends RangedEnemyState

func enter(msg: Dictionary = {}) -> void:
	var scene_tree_timer := get_tree().create_timer(0.75)
	scene_tree_timer.connect("timeout", self, "_on_damagedTimer_timeout")
	
func _on_damagedTimer_timeout() -> void:
	state_machine.transition_to("Firing")

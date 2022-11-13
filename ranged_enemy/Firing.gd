extends RangedEnemyState

const RANGED_PROJECTILE = preload("res://RangedEnemyProjectile.tscn")

func _ready() -> void:
	var attack_timer = Timer.new()
	attack_timer.one_shot = false
	attack_timer.connect("timeout", self, "on_attack_timer_timeout")
	
	add_child(attack_timer)
	attack_timer.start(1.5)

func physics_update(delta: float) -> void:
	if owner.target == null:
		state_machine.transition_to("Idle")

func on_attack_timer_timeout() -> void:
	var target_pos = ranged_enemy.target.position
	var target_dir = (ranged_enemy.target.position - ranged_enemy.position).normalized()
	
	var projectile = RANGED_PROJECTILE.instance()
	projectile.set_dir(target_dir)
	projectile.position = ranged_enemy.position
	
	add_child(projectile)

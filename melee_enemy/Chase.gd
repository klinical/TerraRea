extends MeleeEnemyState

var jump_timer: Timer

func _ready():
	yield(owner, "ready")
	
func enter(_msg: Dictionary = {}) -> void:
	start_jump_timer()

func physics_update(delta: float) -> void:
	var direction_vec = (meleeEnemy.target_location - meleeEnemy.position).normalized()
	meleeEnemy.velocity.y += meleeEnemy.gravity * delta
	meleeEnemy.velocity.x = meleeEnemy.speed * direction_vec.x

# Every 5 seconds,
func start_jump_timer():
	jump_timer = Timer.new()
	jump_timer.autostart = true
	jump_timer.one_shot = false
	jump_timer.connect("timeout", self, "_on_jumpTimer_timeout")

	add_child(jump_timer)
	jump_timer.start(2)

# if the melee enemy is on the ground, enter a jump state
func _on_jumpTimer_timeout() -> void:
	if meleeEnemy.is_on_floor():
		state_machine.transition_to("PrepareJump")

func exit() -> void:
	jump_timer.stop()
	meleeEnemy.velocity.x = 0

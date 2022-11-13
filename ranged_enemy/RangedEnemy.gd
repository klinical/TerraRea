class_name RangedEnemy
extends LivingEntity

var target: Node2D

func _physics_process(delta):
	if health <= 0:
		$StateMachine.transition_to("Idle")
		queue_free()

func set_target(new_target: Node2D) -> void:
	target = new_target

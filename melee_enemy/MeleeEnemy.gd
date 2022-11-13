class_name MeleeEnemy
extends LivingEntity

export (Vector2) var target_location := Vector2.ZERO

var speed: int = 100
var target: Node2D
	
func _physics_process(delta):
	if health <= 0:
		$StateMachine.transition_to("Idle")
		queue_free()
		
	target_location = target.position if target != null and target.position != null else Vector2.ZERO
	move_and_slide(velocity, Vector2(0, -1))

func set_target(new_target: Node2D) -> void:
	target = new_target

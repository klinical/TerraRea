class_name Player
extends LivingEntity

export (int) var run_speed = 500
export (int) var jump_speed = -400

onready var animation_player = get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		$StateMachine.transition_to("Jumping")
	
	move_and_slide(velocity, Vector2(0, -1))

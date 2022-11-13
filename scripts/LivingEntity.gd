class_name LivingEntity
extends KinematicBody2D

export (int) var gravity = 1200
export (int) var health = 100

var velocity = Vector2()

func take_damage(damage: int, source: Node2D) -> void:
	var state_machine: StateMachine = get_node("StateMachine")
	var damage_direction = (position - source.position).normalized()

	state_machine.transition_to("Damaged", {"direction": damage_direction})
	health -= damage

func _physics_process(delta) -> void: 
	velocity.y += delta * gravity

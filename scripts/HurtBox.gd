class_name HurtBox
extends Area2D

var damage_cooldown: bool = false

func take_damage(damage: int, source: Node2D) -> void:
	if damage_cooldown:
		return
	
	owner.take_damage(damage, source)
	damage_cooldown = true
	
	var scene_tree_timer := get_tree().create_timer(0.5)
	scene_tree_timer.connect("timeout", self, "_on_damageTimer_timeout")

func _on_damageTimer_timeout() -> void:
	damage_cooldown = false

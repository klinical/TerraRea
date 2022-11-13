extends Node2D

onready var player: Player
export var attack_radius := 200
	
func _process(delta) -> void:
	if player == null:
		return
	
	var mouse_pos = get_viewport().get_mouse_position()
	# Normalize the vector from player pos to mouse pos
	# since the normalized mouse vector creates a unit circle around the
	# player, multiplying the vector by the desired attack radius will
	# create a circular attack field around the player in attack_radius
	# (must use absolute value since only Q1 of unit circle is positive)
	var origin = player.position
	var aim_vec = (mouse_pos - origin).normalized() * attack_radius
	
	# clamp the position of the weapon based on the weapon origin (player loc)
	# between the min and max values for the aim_vec adjusted for the player pos
	var x = clamp(mouse_pos.x, origin.x - abs(aim_vec.x), origin.x + abs(aim_vec.x))
	var y = clamp(mouse_pos.y, origin.y - abs(aim_vec.y), min(origin.y + abs(aim_vec.y), 543))
	
	position.x = x
	position.y = y

	if Input.is_action_just_pressed("primary"):
		$AnimationPlayer.play("attack")

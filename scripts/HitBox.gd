class_name HitBox
extends Area2D

export (int) var damage := 0

func _on_HitBox_area_entered(area: HurtBox):
	if area == null:
		return
		
	if area.has_method("take_damage"):
		area.take_damage(damage, owner)

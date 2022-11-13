class_name RangedEnemyProjectile
extends Node2D

export (Vector2) var direction

var speed = 200

func _process(delta) -> void:
	position.x = position.x + (direction.x * speed * delta)
	position.y = position.y + (direction.y * speed * delta)

func set_dir(direction: Vector2) -> void:
	self.direction = direction
	
	print(rad2deg(direction.angle()))
	
	rotation_degrees = 90 + rad2deg(direction.angle())

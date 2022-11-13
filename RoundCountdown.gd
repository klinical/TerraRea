extends CanvasLayer

signal done

func _on_ReadyTimer_timeout():
	$Ready.visible = false
	$Go.visible = true
	$GoTimer.start()


func _on_GoTimer_timeout():
	$Go.visible = false
	emit_signal("done")
	queue_free()

func set_round_number(num: int) -> void: 
	$Ready.text = str("ROUND ", num)

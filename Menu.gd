extends CanvasLayer

func _on_StartButton_pressed():
	get_tree().get_root().get_node("Main").start_game()

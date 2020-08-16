extends Control


func _on_CheckButton_toggled(on):
	var animation_background = get_node("Background/Dungeon")
	if on:
		animation_background.play()
	else:
		animation_background.stop()
	
	var animation_cardboard = get_node("Cardboard/Michael")
	if on:
		animation_cardboard.play()
	else:
		animation_cardboard.stop()

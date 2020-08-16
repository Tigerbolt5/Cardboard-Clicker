extends Control

func _on_CheckButton_toggled(on):
	var audio = get_node("AudioStreamPlayer")
	if on:
		audio.play()
	else:
		audio.stop()

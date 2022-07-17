#tool
extends TextureButton

export(String) var text 
export(int) var text_offset

onready var label = $Label
	
func _button_ready():
	rect_pivot_offset = rect_size / 2
	label.text = text
	label.rect_position.y = text_offset

func _on_Button_mouse_entered():
	$AnimationPlayer.play("Expand")

func _on_Button_mouse_exited():
	$AnimationPlayer.play_backwards("Expand")

extends Node2D

export(Texture) var sprite
export(String) var text
export(int) var text_offset = 35

var arr = []
onready var camera = get_node("/root/Canvas/Camera2D")
onready var audio = get_node("/root/Canvas/AudioFX")

func _ready():
	$Button.texture_normal = sprite
	$Button.text = text
	$Button.text_offset = text_offset
	
	for _i in self.get_children():
		if _i.is_in_group("Node"):
			arr.append(_i)	
	
	if self.to_string().find_last("Root") == -1: 
		visible = false 
		$Line2D.visible = false # It doesn't actually need to be in this statement
	

		


func _on_Button_toggled(button_pressed):
	for element in arr:
		element.visible = button_pressed
		$Line2D.add_point(element.position)
		$Line2D.add_point(Vector2.ZERO)
	camera.pan_focus(global_position)
	audio.play()
	$Line2D.visible = button_pressed
	

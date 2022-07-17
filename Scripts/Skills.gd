extends Node2D

func _ready():
	get_tree().call_group("ButtonReady", "_button_ready")

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		

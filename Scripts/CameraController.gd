extends Camera2D

var mouse_start_pos
var screen_start_position

var dragging = false

const MAX_ZOOM = 0.25
const MIN_ZOOM = .75
const ZOOM_WEIGHT = .15   #[0, 1] UPDATE THIS

func _input(event):
	if event.is_action("drag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = zoom * (mouse_start_pos - event.position) + screen_start_position
	elif Input.is_action_just_released("scroll_up") and zoom.x > MAX_ZOOM:
		$Tween.interpolate_property(self, "zoom", zoom, zoom * .85, .3, Tween.TRANS_EXPO, Tween.EASE_OUT)
		$Tween.start()
	elif Input.is_action_just_released("scroll_down") and zoom.x < MIN_ZOOM:
		$Tween.interpolate_property(self, "zoom", zoom, zoom * 1.15, .3, Tween.TRANS_EXPO, Tween.EASE_OUT)
		$Tween.start()
		
func pan_focus(target):
	$Tween.interpolate_property(self, "position", position, target, .5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tween.interpolate_property(self, "zoom", zoom, Vector2(0.5, 0.5), 1, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.start()

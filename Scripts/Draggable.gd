extends CharacterBody2D

var dragging = false
var moveTo = Vector2(0,0)
signal dragsignal;
var mousepos = get_global_mouse_position()


func _process(delta):
	if dragging:
		mousepos = get_global_mouse_position()
		#self.position = Vector2(mousepos.x, mousepos.y)
		velocity = lerp(position, mousepos, 5)
	else:
		velocity = velocity*.9
	if velocity != Vector2.ZERO:
		move_and_slide()
	if dragging && !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		dragging = false;



func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		print("test1")
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			dragging = true
			print("test2")
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()
		

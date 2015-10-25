extends Node2D

var camera
var crosshair
var origin
var sfx

var fire = false
var fire_position = Vector2(0,0)

func _ready():
	add_user_signal("on_shot_fired")
	
	camera = get_node("camera")
	crosshair = get_node("hud/crosshair")
	sfx = camera.get_node("sfx")
	
	crosshair.set_pos(camera.get_viewport().get_rect().size/2)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	if (fire):
		var space = get_world_2d().get_direct_space_state()
		var result = space.intersect_point(camera.get_pos(), 1, [], 0x7FFFFFFF, space.TYPE_MASK_AREA | space.TYPE_MASK_STATIC_BODY)
		var shot_args = { "hit": null, "global_pos": fire_position }
		
		if (not result.empty()):
			result[0].collider.call_deferred("shot", fire_position)
			shot_args["hit"] = result[0].collider
		fire = false
		emit_signal("on_shot_fired", shot_args)

	crosshair.get_node("mouse_pos").set_text("%s" % crosshair.get_pos())
	camera.set_pos(camera.get_viewport().get_mouse_pos())

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON
	&& event.pressed
	&& event.button_index == 1):
		sfx.play("shot_fired")
		fire_position = camera.get_camera_screen_center()
		fire = true
	
func reticle_pos():
	return camera.get_camera_pos()

func get_hud_node():
	return get_node("hud")
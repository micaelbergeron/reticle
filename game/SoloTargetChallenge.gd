extends "State.gd"

var timer
var target
var target_scene = preload("res://Target.scn")

func _init(root_node, ref_node).(root_node, ref_node):
	pass

func _process(delta):
	timer = timer + delta

func _onEnter():
	timer = 0
	target = target_scene.instance()
	
	var reticle_pos = root_node.dependency_container.reticle.camera.get_camera_screen_center()
	var viewport_rect = root_node.dependency_container.reticle.camera.get_viewport_rect()
	
	var reticle_rect = Rect2(reticle_pos.x - viewport_rect.size.x/2,reticle_pos.y - viewport_rect.size.y/2,reticle_pos.x + viewport_rect.end.x/2,reticle_pos.y + viewport_rect.size.y/2)
	
	var minXRange
	var maxXRange
	var minYRange
	var maxYRange
	
	if reticle_rect.pos.x > viewport_rect.pos.x:
		minXRange = reticle_rect.pos.x
	else:
		minXRange = viewport_rect.pos.x
		
	if reticle_rect.pos.y > viewport_rect.pos.y:
		maxXRange = reticle_rect.pos.y
	else:
		maxXRange = viewport_rect.pos.y
		
	if reticle_rect.size.x < viewport_rect.size.x:
		minYRange = reticle_rect.size.x
	else:
		minYRange = viewport_rect.size.x
		
	if reticle_rect.size.y < viewport_rect.size.y:
		maxYRange = reticle_rect.size.y
	else:
		maxYRange = viewport_rect.size.y
	
	randomize()
	target.set_pos(Vector2(rand_range(minXRange, minYRange),rand_range(maxXRange, maxYRange)))
	
	ref_node.add_child(target)
	target.connect("on_target_shot", self, "_onTargetShot")

func _onTargetShot(accuracy, position):
	root_node.dependency_container.OverlayHelper.show_text_overlay(accuracy, timer, target.get_pos())
	root_node.dependency_container.ParticleManager.show_spark_particle(position)
	
	print("Accuracy: " + str(accuracy) + " Time: " + str(timer))
	emit_signal("on_state_completed")

func _onExit():
	target.queue_free()

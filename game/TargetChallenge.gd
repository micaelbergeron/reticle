
extends "State.gd"

func _init(root_node, ref_node).(root_node, ref_node):
	pass

func sendShotInfoToManagers(shot_args, target, timer):
	shot_args["timer"] = timer
	root_node.dependency_container.OverlayHelper.show_hit_text(shot_args, target.get_pos())
	root_node.dependency_container.ParticleManager.show_target_break_particle(target, shot_args["global_pos"])
	root_node.dependency_container.ParticleManager.show_spark_particle(shot_args["global_pos"])
	root_node.dependency_container.ScoreManager.setAccuracyAndTime(shot_args["accuracy"], timer)

func getPosInVisibleScreen():
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
	return Vector2(rand_range(minXRange, minYRange),rand_range(maxXRange, maxYRange))

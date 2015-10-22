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
	
	randomize()
	target.set_pos(Vector2(rand_range(0,1920),rand_range(0,1080)))
	
	target.innerRadius = 10
	target.outerRadius = 20
	
	ref_node.add_child(target)
	
	target.connect("on_target_shot", self, "_onTargetShot")

func _onTargetShot(accuracy):
	root_node.dependency_container.OverlayHelper.show_text_overlay(accuracy, timer, target.get_pos())
	print("Accuracy: " + str(accuracy) + " Time: " + str(timer))
	emit_signal("on_state_completed")

func _onExit():
	target.queue_free()

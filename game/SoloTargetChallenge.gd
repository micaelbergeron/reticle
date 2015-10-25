extends "TargetChallenge.gd"

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
	target.set_pos(getPosInVisibleScreen())
	ref_node.add_child(target)
	target.connect("on_target_shot", self, "_onTargetShot", [])

func _onTargetShot(shot_args):
	sendShotInfoToManagers(shot_args, target, timer)
	emit_signal("on_state_completed")

func _onExit():
	target.queue_free()

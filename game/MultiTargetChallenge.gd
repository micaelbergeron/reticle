
extends "TargetChallenge.gd"

var target_quantity = 3
var target_shot = 0

var timer
var targets={}
var target_scene = preload("res://Target.scn")

func _init(root_node, ref_node).(root_node, ref_node):
	pass

func _process(delta):
	timer = timer + delta

func _onEnter():
	timer = 0
	
	for i in range(target_quantity):
		var target = target_scene.instance()
		target.set_pos(getPosInVisibleScreen())
		
		ref_node.add_child(target)
		target.connect("on_target_shot", self, "_onTargetShot", [])

func _onTargetShot(shot_args):
	var target = shot_args["target"]
	sendShotInfoToManagers(shot_args, target, timer)
	
	target.queue_free()
	timer = 0
	
	if target_shot == target_quantity:
		emit_signal("on_state_completed")

func _onExit():
	pass


extends "State.gd"

var target_quantity = 3
var target_shot = 0

var targets={}
var solo_target_class = preload("res://SoloTargetChallenge.gd")

func _init(root_node, ref_node).(root_node, ref_node):
	pass

func _process(delta):
	for i in range(target_quantity):
		targets[i]._process(delta)

func _onEnter():
	for i in range(target_quantity):
		var target = solo_target_class.new(root_node, ref_node)
		targets[i] = target
		
		target.connect("on_state_completed", self, "_onStateCompleted")
		target._onEnter()

func _onStateCompleted(target):
	target_shot = target_shot + 1
	target.queue_free()
	
	if target_shot == target_quantity:
		emit_signal("on_state_completed")

func _onExit():
	pass

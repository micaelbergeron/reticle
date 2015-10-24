
extends "StateMachine.gd"

var target_quantity = 3
var target_shot = 0
var solo_target_class = preload("res://SoloTargetChallenge.gd")

func _init(root_node, ref_node).(root_node, ref_node):
	pass
	
func _onStateCompleted(target):
	target_shot = target_shot + 1
	._onStateCompleted()

func _getNextState():
	if target_shot < target_quantity:
		var newState = solo_target_class.new(root_node, ref_node)
		return newState

	return null


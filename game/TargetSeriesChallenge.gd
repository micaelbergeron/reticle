
extends "StateMachine.gd"

export var target_quantity = 3
var target_shot = 0
var solo_target_class = preload("res://SoloTargetChallenge.gd")

func _init(ref_node).(ref_node):
	pass
	
func _onStateCompleted():
	target_shot = target_shot + 1
	._onStateCompleted()

func _getNextState():
	if target_shot < target_quantity:
		var newState = solo_target_class.new(refNode)
		return newState

	return null


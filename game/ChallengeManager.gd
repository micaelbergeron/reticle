
extends "StateMachine.gd"

const CHALLENGE_TYPE_QUANTITY = 2

var target_series_challenge_class = preload("res://TargetSeriesChallenge.gd")
var multi_target_challenge_class = preload("res://MultiTargetChallenge.gd")

var challenges_class
var min_target_quantity = 2
var max_target_quantity = 6

func _init(root_node, ref_node).(root_node, ref_node):
	challenges_class = [target_series_challenge_class, multi_target_challenge_class]

func _getNextState():
	randomize()
	var next_challenge_index = round(rand_range(0, CHALLENGE_TYPE_QUANTITY - 1))
	var next_challenge_class = challenges_class[next_challenge_index]
	
	var newState = next_challenge_class.new(root_node, ref_node)
	newState.target_quantity = round(rand_range(min_target_quantity, max_target_quantity))
	
	return newState

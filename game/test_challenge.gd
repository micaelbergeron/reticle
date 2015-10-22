
extends Node2D

var root_node

var challenge
var challenge_class = preload("res://TargetSeriesChallenge.gd")

func _ready():
	root_node = get_parent()

	challenge = challenge_class.new(root_node, self)
	challenge.target_quantity = 100
	challenge._onEnter()
	
	set_process(true)
	
func _process(delta):
	challenge._process(delta)
	

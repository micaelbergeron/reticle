
extends Node2D

var root_node

var challenge
#var challenge_class = preload("res://TargetSeriesChallenge.gd")
var challenge_class = preload("res://MultiTargetChallenge.gd")

func _ready():
	root_node = get_parent()

	challenge = challenge_class.new(root_node, self)
	challenge.target_quantity = 5
	challenge._onEnter()
	
	challenge.connect("on_state_complete", self, "_on_state_complete")
	
	set_process(true)

func _on_state_complete():
	challenge._on_exit()

func _process(delta):
	challenge._process(delta)
	

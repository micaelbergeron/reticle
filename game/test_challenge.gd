
extends Node2D

var root_node

var challenge
var challenge_class = preload("res://ChallengeManager.gd")

func _ready():
	root_node = get_parent()

	challenge = challenge_class.new(root_node, self)
	challenge._onEnter()
	
	set_process(true)

func _process(delta):
	challenge._process(delta)
	

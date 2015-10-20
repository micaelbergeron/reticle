
extends Node2D

var challenge
var challenge_class = preload("res://TargetSeriesChallenge.gd")

func _ready():
	challenge = challenge_class.new(self)
	challenge.target_quantity = 8
	challenge._onEnter()
	
	set_process(true)
	
func _process(delta):
	challenge._process(delta)
	

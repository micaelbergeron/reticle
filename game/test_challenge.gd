
extends Node2D

var challenge
var challenge_class = preload("res://TargetSeriesChallenge.gd")

var test_scene = preload("res://ShowText.scn")

func _ready():
	challenge = challenge_class.new(self)
	challenge.target_quantity = 8
	challenge._onEnter()
	
	var test = test_scene.instance()
	test.text = "GODLIKE !"
	test.set_pos(Vector2(500, 500))
	
	add_child(test)
	test.start_animation()
	
	set_process(true)
	
func _process(delta):
	challenge._process(delta)
	


extends Node2D

var challenge
var challenge_class = preload("res://SoloTargetChallenge.gd")

func _ready():
	challenge = challenge_class.new(self)
	challenge._onEnter()


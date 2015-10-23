extends Node2D

var dependency_container = preload('res://dependency_container.gd').new()

func _init():
	self.dependency_container.init_root(self)

func _ready():
	pass


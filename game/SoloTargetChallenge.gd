extends "State.gd"

var timer
var target

func _init(ref_node).(ref_node):
	pass

func process(delta):
	timer = timer + delta

func _onEnter():
	timer = 0

	var target_scene = preload("res://target.scn")
	
	target = target_scene.instance()
	refNode.add_child(target)
	
	target.connect("on_target_shot", self, "_onTargetShot")

func _onTargetShot(accuracy):
	print(accuracy)
	#emit_signal("on_state_completed", 0, timer)

func _onExit():
	target.queue_free()

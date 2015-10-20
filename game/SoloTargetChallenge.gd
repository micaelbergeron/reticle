extends "State.gd"

var timer
var target
var target_scene = preload("res://Target.scn")

func _init(ref_node).(ref_node):
	pass

func _process(delta):
	timer = timer + delta

func _onEnter():
	timer = 0
	
	target = target_scene.instance()
	
	randomize()
	target.set_pos(Vector2(rand_range(0,1920),rand_range(0,1080)))
	
	target.innerRadius = 10
	target.outerRadius = 20
	
	refNode.add_child(target)
	
	target.connect("on_target_shot", self, "_onTargetShot")

func _onTargetShot(accuracy):
	print(timer)
	emit_signal("on_state_completed")
	#emit_signal("on_state_completed", accuracy, timer)

func _onExit():
	target.queue_free()

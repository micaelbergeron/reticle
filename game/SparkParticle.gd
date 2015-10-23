
extends Node2D

func _init():
	pass

func _ready():
	pass
	
func start_emitting():
	var particle_node = get_node("Particles2D")

	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(particle_node.get_lifetime())
	timer.start()
	
	add_child(timer)
	get_node("Particles2D").set_emitting(true)
	
	yield(timer, "timeout")
	self.queue_free()
	

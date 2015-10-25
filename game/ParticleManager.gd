extends Node

var SparkParticle = preload("res://SparkParticle.scn")
var TargetBreakParticle = preload("res://targets/break_particles.scn")

func _ready():
	pass
	
func show_spark_particle(pos):
	var spark_particle = SparkParticle.instance()
	spark_particle.set_pos(pos)
	add_child(spark_particle)
	spark_particle.start_emitting()
	return spark_particle

func show_target_break_particle(target, pos):
	var target_break_particle = TargetBreakParticle.instance()
	#target_break_particle.get_material().set_shader_param("innerTint", target.innerColor)
	#target_break_particle.get_material().set_shader_param("outerTint", target.outerColor)
	target_break_particle.set_pos(pos)
	add_child(target_break_particle)
	_start_emitting(target_break_particle)
	return target_break_particle
	
func _start_emitting(emitter):
	var timer = Timer.new()
	#timer.set_one_shot(true)
	#timer.set_wait_time(emitter.get_lifetime())
	#timer.start()
	#add_child(timer)
	
	emitter.set_emitting(true)
	#yield(timer, "timeout")
	#emitter.queue_free()
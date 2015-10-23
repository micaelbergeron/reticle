
extends Node

var SparkParticle = preload("res://SparkParticle.scn")

func _ready():
	pass
	
func show_spark_particle(pos):
	var spark_particle = SparkParticle.instance()
	spark_particle.set_pos(pos)
	
	add_child(spark_particle)
	spark_particle.start_emitting()

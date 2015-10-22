extends Node2D

var text = "DEFAULT TEXT"

func _init():
	pass

func _ready():
	get_node("Label").set_text(text)
	get_node("AnimationPlayer").connect("finished", self, "_animation_finished")

func start_animation():
	get_node("AnimationPlayer").play("ShowLabel")

func _animation_finished():
	queue_free()
extends "State.gd"

export var states = []
var current_state = null

func _ready():
	pass
	
func changeState(newState):
	if current_state != null:
		current_state.disconnect("on_state_exit", self, "onStateExit")
		
	current_state = newState
	current_state.connect("on_state_exit", self, "onStateExit")
	
func process(delta):
	if current_state != null:
		current_state.process(delta)
	
func onStateExit():
	pass
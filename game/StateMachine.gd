extends "State.gd"

var states = []
var current_state = null

func _ready():
	set_process(true)

func _getNextState():
	return null

func changeState(newState):
	if current_state != null:
		current_state.disconnect("on_state_completed", self, "_onStateCompleted")
		current_state = null
		
	current_state.connect("on_state_completed", self, "_onStateCompleted")
	
	current_state.onEnter()
	current_state = newState

func _process(delta):
	if current_state != null:
		current_state.process(delta)

func _onStateCompleted():
	var nextState = _getNextState()
	
	if nextState != null:
		changeState(nextState)
	else:
		_onExit()
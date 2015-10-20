extends "State.gd"

var states = []
var current_state = null

func _init(ref_node).(ref_node):
	pass

func _getNextState():
	return null

func changeState(newState):
	_stopCurrentState()
	newState.connect("on_state_completed", self, "_onStateCompleted")
	
	newState._onEnter()
	current_state = newState

func _stopCurrentState():
	if current_state != null:
		current_state._onExit()
		current_state.disconnect("on_state_completed", self, "_onStateCompleted")
		current_state = null

func _process(delta):
	if current_state != null:
		current_state._process(delta)

func _startNextState():
	var nextState = _getNextState()
	
	if nextState != null:
		changeState(nextState)
	else:
		_onExit()

func _onStateCompleted():
	_startNextState()

func _onEnter():
	_startNextState()
	
func _onExit():
	_stopCurrentState()
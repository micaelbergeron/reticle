export var key = ""

func process(delta):
	pass

func onEnter():
	emit_signal("on_state_enter", key)

func onExit():
	emit_signal("on_state_exit", key)
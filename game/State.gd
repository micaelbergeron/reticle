
var root_node
var ref_node

func _init(root_node, ref_node):
	self.root_node = root_node
	self.ref_node = ref_node
	
	add_user_signal("on_state_completed")

func _process(delta):
	pass

func _onEnter():
	pass

func _onExit():
	pass
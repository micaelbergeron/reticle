
var root_node

var OverlayHelper = preload('res://OverlayHelper.gd').new()

func init_root(root_node):
	self.root_node = root_node
	
	root_node.add_child(OverlayHelper)

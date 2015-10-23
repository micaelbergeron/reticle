var root_node
var OverlayHelper = preload("res://OverlayHelper.gd").new()
var MusicManager = preload("res://MusicManager.gd").new()

func init_root(root_node):
	self.root_node = root_node
	root_node.add_child(OverlayHelper)
	root_node.add_child(MusicManager)

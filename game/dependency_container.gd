var root_node

var reticle = preload("res://reticle.scn").instance()
var ScoreManager = preload("res://ScoreManager.scn").instance()
var OverlayHelper = preload("res://OverlayHelper.gd").new()
var ParticleManager = preload("res://ParticleManager.gd").new()
var MusicManager = preload("res://MusicManager.gd").new()

func init_root(root_node):
	self.root_node = root_node
	
	root_node.add_child(reticle)
	reticle.get_hud_node().add_child(ScoreManager)
	
	root_node.add_child(OverlayHelper)
	root_node.add_child(ParticleManager)
	root_node.add_child(MusicManager)

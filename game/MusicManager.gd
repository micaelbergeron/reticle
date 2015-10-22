extends StreamPlayer

var tracks = {
	"precipice":	preload("res://music/precipice.ogg"),
	"call":			preload("res://music/call.ogg"),
	"laconia":		preload("res://music/laconia.ogg"),
	"hazard": 		preload("res://music/hazard.ogg"),
	"sanity": 		preload("res://music/sanity.ogg"),
	"tilt": 		preload("res://music/tilt.ogg"),
	"rolling_on":	preload("res://music/rolling_on.ogg"),
}

func _init(root):
	# register in dependency_container
	pass

func _ready():
	play("precipice")
	pass
	
func play(track_name):
	if (!tracks.has(track_name)): 
		return
	
	stop()
	set_stream(tracks[track_name])
	.play()

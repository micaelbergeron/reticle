
var text = [
	["INHUMAN REACTION", "MAGNIFICENT", "GREAT", "FINE", "SLOW", "VOLVO PLS"],
	["GODLIKE", "ACE", "VERY GOOD", "FINE", "SLOW", "VERY SLOW"],
	["REKT", "PERFECT", "GOOD", "FINE", "SLOW", " LAG"],
	["UNBELIVABLE", "MARVELLOUS", "FINE", "BAD", "VERY BAD", "TRASH"],
	["INCREDIBLE", "NICE", "BOFF", "BAD", "VERY BAD", "TRASH"]
]

func _ready():
	pass

func getText(accuracy, time):
	var a = _get_accuracy_idx(accuracy)
	var t = _get_time_idx(time)
	return text[a][t]
	
func getColor(accuracy, time):
	var red = Color(0.6,0.1,0.1)
	var green = Color(0.2,1,0.2)
	var purple = Color(0.8,0,0.7)
	
	if (_get_time_idx(time) > 3):
		return purple
	
	var a_interpolate = 1-accuracy
	var accuracy_c = red.linear_interpolate(green, a_interpolate)
	#var t_interpolate = 1-(_get_time_idx(time)/5)
	#var time_c = red.linear_interpolate(yellow, t_interpolate)
	
	return accuracy_c 

	
func _get_accuracy_idx(accuracy):
	var accuracyIndex = 0
	if accuracy <= 0.2:
		accuracyIndex = 0
	elif accuracy <= 0.4:
		accuracyIndex = 1
	elif accuracy <= 0.6:
		accuracyIndex = 2
	elif accuracy <= 0.8:
		accuracyIndex = 3
	else:
		accuracyIndex = 4
	return accuracyIndex
	
func _get_time_idx(time):
	var timeIndex = 0
	if time <= 0.5:
		timeIndex = 0
	elif time <= 1.0:
		timeIndex = 1
	elif time <= 1.5:
		timeIndex = 2
	elif time <= 2.0:
		timeIndex = 3
	elif time <= 2.5:
		timeIndex = 4
	else:
		timeIndex = 5
	return timeIndex

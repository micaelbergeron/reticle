
var text = [
			["INHUMAN REACTION", "MAGNIFICENT", "GREAT", "FINE", "SLOW", "VERY SLOW"],
			["GODLIKE", "ACE", "VERY GOOD", "FINE", "SLOW", "VERY SLOW"],
			["REKT", "PERFECT", "GOOD", "FINE", "SLOW", "VERY SLOW"],
			["UNBELIVABLE", "MARVELLOUS", "FINE", "BAD", "VERY BAD", "TRASH"],
			["INCREDIBLE", "NICE", "BOFF", "BAD", "VERY BAD", "TRASH"]
		   ]

func _ready():
	pass

func getText(accuracy, time):
	var accuracyIndex = 0
	var timeIndex = 0
	
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
		
	return text[accuracyIndex][timeIndex]

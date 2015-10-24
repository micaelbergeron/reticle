
extends Node2D

var accuracyScoreLabel
var timeScoreLabel

var lastShotQuantity = 15
var lastShotCurrentIndex = 0

var lastAccuracies = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var lastTimes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func _ready():
	accuracyScoreLabel = get_node("AccuracyScore")
	timeScoreLabel = get_node("TimeScore")

func setAccuracyAndTime(accuracy, time):
	print(lastShotCurrentIndex)
	
	lastAccuracies[lastShotCurrentIndex] = accuracy
	lastTimes[lastShotCurrentIndex] = time
	
	if lastShotCurrentIndex == lastShotQuantity - 1:
		lastShotCurrentIndex = 0
	else:
		lastShotCurrentIndex = lastShotCurrentIndex + 1
	
	var sumLastAccuracies = 0
	var lastAccuraciesCount = 0
	
	for i in lastAccuracies:
		if i > 0:
			sumLastAccuracies = sumLastAccuracies + i
			lastAccuraciesCount = lastAccuraciesCount + 1
			
	var sumLastTimes = 0
	var lastTimesCount = 0
	
	for i in lastTimes:
		if i > 0:
			sumLastTimes = sumLastTimes + i
			lastTimesCount = lastTimesCount + 1
	
	var averageAccuracy = sumLastAccuracies / lastAccuraciesCount
	var averageTime = sumLastTimes / lastTimesCount
	
	accuracyScoreLabel.set_text(str(100 - round(averageAccuracy * 100)))
	timeScoreLabel.set_text(str("%.2f" % averageTime) + " sec")
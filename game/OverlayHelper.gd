
extends Node

var TextOverlay = preload("res://TextOverlay.scn")
var overlay_text_table = preload('res://OverlayTextTable.gd').new()

func _ready():
	pass

func show_text_overlay(accuracy, time, pos):
	var text_overlay = TextOverlay.instance()
	text_overlay.text = overlay_text_table.getText(accuracy, time) + " !"
	text_overlay.set_pos(pos)
	
	add_child(text_overlay)
	text_overlay.start_animation()

func show_text(text, pos):
	var text_overlay = TextOverlay.instance()
	text_overlay.text = text
	text_overlay.set_pos(pos)
	add_child(text_overlay)
	text_overlay.start_animation()

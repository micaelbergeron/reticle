
extends Node

var TextOverlay = preload("res://TextOverlay.scn")
var overlay_text_table = preload('res://OverlayTextTable.gd').new()

func _ready():
	pass

func show_hit_text(shot_args, pos):
	var text_overlay = TextOverlay.instance()
	text_overlay.text = overlay_text_table.getText(shot_args["accuracy"], shot_args["timer"]) + "!"
	text_overlay.get_label().add_color_override("font_color_shadow", Color(1,1,1))
	text_overlay.get_label().add_color_override("font_color", overlay_text_table.getColor(shot_args["accuracy"], shot_args["timer"]))
	text_overlay.set_pos(pos)
	
	add_child(text_overlay)
	text_overlay.start_animation()

func show_text(text, pos):
	var text_overlay = TextOverlay.instance()
	text_overlay.text = text
	text_overlay.set_pos(pos)
	add_child(text_overlay)
	text_overlay.start_animation()

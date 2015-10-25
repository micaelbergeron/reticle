extends Area2D

var innerColor setget innerColor_changed
var outerColor setget outerColor_changed

export var innerRadius = 25
export var outerRadius = 50

var collision
var shape
var sfx
var sprite
var press_count = 0
var shot_count = 0

func _ready():
	add_user_signal("on_target_shot")
	sfx = get_node("sfx")
	sprite = get_node("sprite")
	collision = CollisionShape2D.new()
	shape = CircleShape2D.new()
	
	_set_child_colors()
	collision.set_pos(Vector2(1,1))
	collision.set_shape(shape)

	add_child(collision)
	shape.set_radius(outerRadius)

func _enter_tree():
	get_node("anim").play("spawn")
	
func _set_child_colors():
	self.innerColor = Color("#97312d")
	self.outerColor = Color("#d8d71a")

func innerColor_changed(color):
	var spriteMat = sprite.get_material()
	spriteMat.set_shader_param("outerTint", color)
	
func outerColor_changed(color):
	var spriteMat = sprite.get_material()
	spriteMat.set_shader_param("innerTint", color)
	
func shot(position):
	shot_count = shot_count + 1
	sfx.play("target_hit")
	
	var local_position = get_global_transform().affine_inverse().xform(position)
	emit_signal("on_target_shot", {
		"target" : self,
		"accuracy": local_position.length() / outerRadius,
		"global_pos": position,
		"mouse_speed": Input.get_mouse_speed(),
	})

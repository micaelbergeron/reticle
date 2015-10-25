extends Area2D

export var innerColor = Color("#97312d")
export var outerColor = Color("#d8d71a")
#export var outerColor = Color(1,0,0,1)

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
	
	collision.set_pos(Vector2(1,1))
	collision.set_shape(shape)

	add_child(collision)
	shape.set_radius(outerRadius)
	#_set_child_colors()
	
func _set_child_colors():
	var spriteMat = sprite.get_material()
	spriteMat.set_shader_param("innerTint", innerColor)
	spriteMat.set_shader_param("outerTint", outerColor)

func shot(position):
	shot_count = shot_count + 1
	sfx.play("target_hit")
	
	var local_position = get_global_transform().affine_inverse().xform(position)
	emit_signal("on_target_shot", {
		"accuracy": local_position.length() / outerRadius,
		"global_pos": position,
		"mouse_speed": Input.get_mouse_speed(),
	})

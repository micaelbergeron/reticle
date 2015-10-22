extends Area2D

export var innerColor = Color(1,1,1)
export var outerColor = Color(1,0,0)
export var innerRadius = 25
export var outerRadius = 50

var collision
var shape

var press_count = 0

func _ready():
	add_user_signal("on_target_shot")
	
	collision = CollisionShape2D.new()
	shape = CircleShape2D.new()
	
	collision.set_pos(Vector2(1,1))
	collision.set_shape(shape)

	add_child(collision)
	shape.set_radius(outerRadius)

func _draw():
	draw_circle(Vector2(0,0), outerRadius, outerColor)
	draw_circle(Vector2(0,0), innerRadius, innerColor)

func shot(position):
	position = get_global_transform().affine_inverse().xform(position)
	if (position.length() < innerRadius):
		emit_signal("on_target_shot", ACCURACY_INNER)
		inner_press_count = inner_press_count + 1
	else:
		emit_signal("on_target_shot", ACCURACY_OUTER)
		outer_press_count = outer_press_count + 1
	
	get_node("Label").set_text(str(inner_press_count) + " " + str(outer_press_count))

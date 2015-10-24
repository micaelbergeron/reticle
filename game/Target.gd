extends Area2D

export var innerColor = Color(1,1,1)
export var outerColor = Color(1,0,0)
export var innerRadius = 25
export var outerRadius = 50

var collision
var shape
var sfx

var shot_count = 0

func _ready():
	add_user_signal("on_target_shot")
	
	sfx = get_node("sfx")
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
	shot_count = shot_count + 1
	sfx.play("target_hit")
	
	var local_position = get_global_transform().affine_inverse().xform(position)
	var accuracy = local_position.length() / outerRadius;
	
	emit_signal("on_target_shot", accuracy, position)
	

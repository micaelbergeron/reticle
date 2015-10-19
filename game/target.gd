extends Area2D

export var innerColor = Color(1,1,1)
export var outerColor = Color(1,0,0)
export var innerRadius = 25
export var outerRadius = 50

var collision
var shape

var inner_press_count = 0
var outer_press_count = 0

func _ready():
	collision = CollisionShape2D.new()
	shape = CircleShape2D.new()
	
	collision.set_pos(Vector2(1,1))
	collision.set_shape(shape)

	add_child(collision)
	shape.set_radius(outerRadius)
	
	set_process(true)

func _process(delta):
	update()

func _draw():
	draw_circle(Vector2(0,0), outerRadius, outerColor)
	draw_circle(Vector2(0,0), innerRadius, innerColor)
	
func _input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.button_index == 1 && event.pressed):
		event = make_input_local(event)
		
		if (event.pos.length() < innerRadius):
			emit_signal("inner_press_count")
			inner_press_count = inner_press_count + 1
		else:
			emit_signal("outer_press_count")
			outer_press_count = outer_press_count + 1
		
		get_node("label").set_text(str(inner_press_count) + " " + str(outer_press_count))


class_name Ball
extends RigidBody3D

@export var line: Line
@export var max_force: float = 5.0
@export var max_drag: float = 100.0

var mouse_click: Vector2
var mouse_drag: Vector2

var mouse_direction: Vector2
var mouse_multiplier: float
var ball_direction: Vector3
var ball_velocity: Vector3

var button_down: bool

func _process(_delta: float) -> void:
	draw_line()

func _input(event) -> void:
	if event is InputEventMouseMotion:
		mouse_drag = event.position
		mouse_direction = (mouse_click - mouse_drag).normalized()
		var mouse_length: float = (mouse_click - mouse_drag).length()
		mouse_multiplier = mouse_length / max_drag
		ball_direction = Vector3(mouse_direction.x, 0.0, mouse_direction.y)
		ball_velocity = ball_direction * (mouse_multiplier * max_force)
		
	if event is InputEventMouseButton:
		button_down = event.pressed
		if button_down == true:
			mouse_click = event.position
		else:
			apply_central_impulse(ball_velocity)

func draw_line() -> void:
	var from: Vector3 = Vector3.ZERO
	var to: Vector3 = Vector3.ZERO

	if button_down == true:
		from = position
		to = position + ball_direction

	line.draw_line_3d(from, to)

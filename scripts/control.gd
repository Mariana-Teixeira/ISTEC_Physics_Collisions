extends Control

@export var ball: Ball

func _process(_delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	var start_point = Vector2.ZERO
	var end_point = Vector2.ZERO
	
	if ball.button_down == true:
		start_point = ball.mouse_click
		end_point = ball.mouse_drag
	
	draw_arc(start_point, ball.max_drag, 0.0, 360.0, 16, Color.RED, 1.0)
	draw_line(start_point, end_point, Color.GREEN, 1.0)

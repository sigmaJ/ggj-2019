extends Camera2D

var mouse_last_location
var mouse_button_pressed

var ball = load("res://ball.png")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if(mouse_button_pressed):
		var mouse_location = get_viewport().get_mouse_position()
		position = get_camera_screen_center()
		position += mouse_last_location - mouse_location
		mouse_last_location = mouse_location

func _input(event):
	if event is InputEventMouseButton and Input.is_key_pressed(KEY_SPACE):
		if event.is_pressed():  # Mouse button down.
			mouse_button_pressed = true
			mouse_last_location = get_viewport().get_mouse_position()
		elif not event.is_pressed():  # Mouse button released.
			mouse_button_pressed = false
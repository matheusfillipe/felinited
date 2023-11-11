extends CharacterBody2D

@onready var _animation_player = $AnimatedSprite2D
@export_enum("white", "orange", "black") var cat_color: String = "white"
@export var speed: float = 400

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func animate():
	var animation_name_prefix = cat_color+ "_cat_"
	var animation_name = null
	if Input.is_action_pressed("ui_right"):
		animation_name = animation_name_prefix + "right"
	elif Input.is_action_pressed("ui_left"):
		animation_name = animation_name_prefix + "left"
	elif Input.is_action_pressed("ui_up"):
		animation_name = animation_name_prefix + "up"
	elif Input.is_action_pressed("ui_down"):
		animation_name = animation_name_prefix + "down"

	if animation_name != null:
		_animation_player.play(animation_name)
	else:
		_animation_player.stop()

func _process(_delta):
	animate()
	get_input()
	move_and_slide()

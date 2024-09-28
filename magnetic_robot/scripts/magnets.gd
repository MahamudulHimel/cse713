extends Node2D

const MAGNET_STRENGTH = 1000000
@onready var ai_controller= $AIController2D
@onready var field = $".."

@onready var color_rect = $ColorRect
@onready var color_rect_2 = $ColorRect2
@onready var north = $"../north"
@onready var target = $"../target"
@onready var box = $"../box"

var m1
var m2

var magnet_strenght = 0
var magnet_position = 0

var box_target_distance_past = -1
var box_north_distance_past = -1

var start = true

var red = Color(1,0,0)
var grey = Color(0.5,0.5,0.5)
var blue = Color(0,0,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	ai_controller.init(self)
	
func reset():
	target._ready()
	box._ready()
	north._ready()
	start = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if ai_controller.needs_reset:
		ai_controller.reset()
		reset()
		return
	if ai_controller.heuristic == "human":
		m2 = Input.get_axis("ui_down","ui_up")
		m1 = Input.get_axis("ui_left", "ui_right")
	else:
		var out = ai_controller.output
		if out == 0:
			m1 = -1
			m2 = 0
		elif out == 1:
			m1 = 1
			m2 = 0
		elif out == 2:
			m1 = 0
			m2 = -1
		elif out == 3:
			m1 = 0
			m2 = 1
		else:
			m1 = 0
			m2 = 0
	
	display_color()
	set_magnet_strength()
	var box_north_distance = (box.position - north.position).length()
	var box_target_distance = (box.position - target.position).length()
	
	if start:
		ai_controller.reward = 0
		box_north_distance_past = box_north_distance
		box_target_distance_past = box_target_distance
		start = false
	else:
		if box_north_distance_past - box_north_distance > 0.05:
			ai_controller.reward = box_north_distance_past - box_north_distance
			box_north_distance_past = box_north_distance
		elif box_target_distance_past - box_target_distance > 0.05:
			ai_controller.reward = 5 * (box_target_distance_past - box_target_distance)
			box_target_distance_past = box_target_distance
		else:
			ai_controller.reward = -10
	
func display_color():
	if m1 > 0:
		color_rect.color = blue
	elif m1 < 0:
		color_rect.color = red
	else:
		color_rect.color = grey
	
	if m2 > 0:
		color_rect_2.color = blue
	elif m2 < 0:
		color_rect_2.color = red
	else:
		color_rect_2.color = grey

func set_magnet_strength():
	if m1 != 0:
		magnet_strenght = m1 * MAGNET_STRENGTH
		magnet_position = 0
	else:
		magnet_strenght = m2 * MAGNET_STRENGTH
		magnet_position = 1
		
func game_done():
	ai_controller.reward += 100
	ai_controller.needs_reset = true
	ai_controller.done = true

func game_over():
	ai_controller.reward = 100
	ai_controller.needs_reset = true
	ai_controller.done = true

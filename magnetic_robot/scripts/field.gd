extends Node2D
@onready var magnets = $magnets

var magnet_strenght = 0
var magnet_position = 0
const BOX = preload("res://scenes/box.tscn")

func _ready():
	pass # Replace with function body.


func _process(delta):
	magnet_strenght = magnets.magnet_strenght
	magnet_position = magnets.magnet_position

func need_box():
	add_child(BOX.instantiate())

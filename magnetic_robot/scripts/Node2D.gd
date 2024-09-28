extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func location_reset():
	position = Vector2(randi_range(50, 1100), randi_range(50,600))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

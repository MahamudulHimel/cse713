extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = randi_range(100, 1050)
	position.y = randi_range(100, 550)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	body.in_target()

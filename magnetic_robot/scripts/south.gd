extends RigidBody2D

var magnet_strenght = 0
var magnet_distance = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	magnet_strenght = Autoload.magnet_strenght
	magnet_distance = position.x + 50 if Autoload.magnet_position == 0 else 700 - position.y
	if Autoload.magnet_position:
		constant_force.y = magnet_strenght / magnet_distance**2
		constant_force.x = 0
	else:
		constant_force.x = - magnet_strenght / magnet_distance**2
		constant_force.y = 0
	print(constant_force)
	

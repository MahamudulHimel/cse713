extends RigidBody2D
@onready var field = $".."

var magnet_strenght = 0
var magnet_distance = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	PhysicsServer2D.body_set_state(
	get_rid(),
	PhysicsServer2D.BODY_STATE_TRANSFORM,
	Transform2D.IDENTITY.translated(Vector2(randi_range(100, 1000), randi_range(50,600)))
)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	magnet_strenght = field.magnet_strenght
	magnet_distance = position.x + 50 if field.magnet_position == 0 else 700 - position.y
	if field.magnet_position :
		constant_force.y = - magnet_strenght / magnet_distance**2
		constant_force.x = 0
	else:
		constant_force.x = magnet_strenght / magnet_distance**2
		constant_force.y = 0
	
func in_target():
	pass

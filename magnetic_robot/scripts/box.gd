extends RigidBody2D
@onready var magnets = $"../magnets"



# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	PhysicsServer2D.body_set_state(
	get_rid(),
	PhysicsServer2D.BODY_STATE_TRANSFORM,
	Transform2D.IDENTITY.translated(Vector2(randi_range(100, 1000), randi_range(50, 600)))
)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func in_target():
	magnets.game_done()

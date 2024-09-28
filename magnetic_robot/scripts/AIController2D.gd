extends AIController2D

@onready var north = $"../../north"
@onready var target = $"../../target"
@onready var box = $"../../box"

var output = 0

func get_obs() -> Dictionary:
	var box_target = box.position - target.position
	var north_box = north.position - box.position
	var obs = [
		box_target.x / 1150,
		box_target.y / 650,
		north_box.x / 1150,
		north_box.y / 650,
		north.linear_velocity.x / 1500,
		north.linear_velocity.y / 1500,
		box.linear_velocity.x / 1500,
		box.linear_velocity.y / 1500
	]
	return {"obs": obs}

func get_action_space() -> Dictionary:
	return {
		"action": {"size": 5, "action_type": "discrete"},
	}
	
func set_action(action) -> void:
	output = action["action"]

func get_reward() -> float:
	return reward

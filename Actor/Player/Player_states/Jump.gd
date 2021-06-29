extends State

func play_current_state(delta):
	parent.move_actor(delta)
	parent.apply_gravity(delta)
func check_exit_condition():
	if !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"
	if Input.is_action_pressed("dash"):
		return "Dash"
	if Input.is_action_pressed("smash"):
		return "Smash"

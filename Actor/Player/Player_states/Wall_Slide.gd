extends State

func play_current_state(delta):
	parent.wall_slide(delta)
	parent.check_wall_slide()
	parent.apply_gravity(delta)
func check_exit_condition():
	if !parent.can_wall_slide:
		return "Idle"
	if parent.check_wall_jump():
		return "Wall_Jump"
func check_previous_state_condition(previous_state):
	pass

extends State

func play_current_state(delta):
	parent.check_wall_slide()
	parent.wall_jump(delta)
	parent.move_actor(delta)

func check_exit_condition():
	if !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"
	elif !parent.check_wall_jump() && parent.check_wall_slide():
		return "Wall_Slide"
	elif parent.is_on_floor():
		return "Idle"
func check_previous_state_condition(previous_state):
	pass

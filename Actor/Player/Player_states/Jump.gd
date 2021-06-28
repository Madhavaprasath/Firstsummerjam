extends State

func play_current_state(delta):
	parent.move_actor(delta)

func check_exit_condition():
	if !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"

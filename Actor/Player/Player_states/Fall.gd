extends State

func play_current_state(delta,parent):
	parent.move_actor(delta)

func check_exit_condition(parent):
	if parent.is_on_floor():
			return "Idle"
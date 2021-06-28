extends State

func play_current_state(delta):
	parent.move_actor(delta)
	if Input.is_action_just_released("ui_down"):
		parent.cancel_fall_through()
func check_exit_condition():
	if parent.is_on_floor():
			return "Idle"
	if !parent.is_on_floor():
		pass

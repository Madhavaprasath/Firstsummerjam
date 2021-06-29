extends State

func play_current_state(delta):
	parent.move_actor(delta)
	parent.apply_gravity(delta)
	parent.set_collision_mask_bit(1,false)

func check_exit_condition():
	if !parent.is_on_floor():
		return "Fall"
func check_previous_state_condition(previous_state):
	pass

extends State

func play_current_state(delta):
	parent.move_actor(delta)
	parent.apply_gravity(delta)
func check_exit_condition():
	if parent.is_on_floor():
		if parent.direction==0:
			return "Idle"
	elif !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"
		elif parent.velocity.y<0:
			return "Jump"

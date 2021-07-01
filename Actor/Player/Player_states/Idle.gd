extends State


signal Emit_particles(falling)

func play_current_state(delta):
	parent.move_actor(delta,true)
	parent.apply_gravity(delta)
func check_exit_condition():
	if parent.is_on_floor():
		if parent.check_direction()!=0:
			return "Run"
		elif funcref(parent,"can_fall_through") && Input.is_action_pressed("ui_down"):
			return "Drop_fall"
	elif !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"
		elif parent.velocity.y<0:
			return "Jump"
func check_previous_state_condition(previous_state):
	if previous_state in ["Dash","Smash"]:
		emit_signal("Emit_particles",false)

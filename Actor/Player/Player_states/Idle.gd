extends State


signal Emit_particles(falling)

func play_current_state(delta):
	parent.velocity.x=0
	
func check_exit_condition():
	if parent.is_on_floor():
		if parent.check_direction()!=0:
			return "Run"
		elif parent.velocity.y<0:
			return "Jump"
		elif funcref(parent,"can_fall_through") && Input.is_action_pressed("ui_down"):
			return "Drop_fall"
	elif !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"

func check_previous_state_condition(previous_state):
	match previous_state:
		"Smash":
			emit_signal("Emit_particles",false)

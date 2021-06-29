extends State


signal Emit_particles(falling)



func play_current_state(delta):
	parent.velocity.y=1000
	emit_signal("Emit_particles",true)

func check_exit_condition():
	if parent.is_on_floor():
		return "Idle"



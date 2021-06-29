extends State


signal Emit_particles(falling)



func play_current_state(delta):
	parent.velocity.y+=6*parent.gravity*delta
	emit_signal("Emit_particles",true)
	parent.velocity=parent.move_and_slide(parent.velocity,Vector2.UP)
	parent.destroy_platform()


func check_exit_condition():
	if parent.is_on_floor():
		return "Idle"



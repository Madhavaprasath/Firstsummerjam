extends State

signal Emit_particles(falling)

var dash_speed=750

func play_current_state(delta):
	parent.velocity.x=dash_speed
	parent.velocity=parent.move_and_slide(parent.velocity,Vector2.UP)
	parent.destroy_platform()
	emit_signal("Emit_particles",true)
	yield(get_tree().create_timer(0.25),"timeout")
	parent.apply_gravity(delta)



func check_exit_condition():
	if parent.is_on_floor():
		return "Idle"

func check_previous_state_condition(previous_state):
	pass



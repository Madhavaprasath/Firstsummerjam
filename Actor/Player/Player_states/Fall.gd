extends State

func play_current_state(delta):
	parent.move_actor(delta)
	parent.apply_gravity(delta)
	parent.check_wall_slide()
	if Input.is_action_just_released("ui_down"):
		parent.cancel_fall_through()
func check_exit_condition():
	if parent.is_on_floor():
			return "Idle"
	if Input.is_action_pressed("smash"):
		return "Smash"
	if parent.can_wall_slide:
		return "Wall_Slide"

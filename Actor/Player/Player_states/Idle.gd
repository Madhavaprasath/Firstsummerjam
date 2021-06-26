extends Node
class_name State


func play_current_state(delta,parent):
	parent.velocity.x=0
func check_exit_condition(parent):
	if parent.is_on_floor():
		if parent.check_direction()!=0:
			return "Run"
		elif parent.velocity.y<0:
			return "Jump"
	elif !parent.is_on_floor():
		if parent.velocity.y>0:
			return "Fall"

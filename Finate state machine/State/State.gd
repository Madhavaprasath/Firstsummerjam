extends Node
class_name State

onready var parent=get_parent().get_parent()



func play_current_state(delta):
	pass


func check_exit_condition():
	pass

func check_previous_state_condition(previous_state):
	pass

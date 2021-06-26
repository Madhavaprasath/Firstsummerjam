extends Node

onready var fsm=get_parent()

func state_things():
	print("hello")

func exit_condition():
	fsm.pop_state()
	fsm.push_state("Run")

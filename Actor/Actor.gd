extends KinematicBody2D

export (int) var speed=200


var velocity:Vector2=Vector2.ZERO
var jump_duration=0.75

onready var gravity:float= (2*max_jump_height)/pow(jump_duration,2)
onready var max_jump_height:float=3*64
onready var min_jump_height:float=2*64
onready var max_jump_velocity:float=-sqrt(2*gravity*max_jump_height)
onready var min_jump_velocity:float=-sqrt(2*gravity*min_jump_height)
onready var fsm:Stack_Finate_state_machine=get_node("FSM")



func move_actor(delta):
	pass




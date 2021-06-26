extends Node
class_name Stack_Finate_state_machine


onready var animation_player=get_parent().get_node("Body/AnimationPlayer")
var stack:Array
 
func stack_fsm():
	self.stack=[]

func _physics_process(delta):
	var current_state=get_current_state()
	if current_state !=null:
		get_node(current_state).state_things()
		if animation_player.current_animation!=current_state:
			animation_player.play(current_state)

func push_state(state):
	if get_current_state() !=state:
		stack.push_front(state)

func pop_state(state):
	stack.pop_front()

func get_current_state():
	return stack[len(stack)-1] if len(stack)>0 else null

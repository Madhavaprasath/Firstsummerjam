extends Node
class_name Stack_Finate_state_machine

onready var parent=get_parent()
onready var animation_player=parent.get_node("Body/AnimationPlayer")
var stack:Array
 
func _ready():
	self.stack=[]

func _physics_process(delta):
	var current_state=get_current_state()
	if current_state !=null:
		print(current_state)
		get_node(current_state).play_current_state(delta,parent)
		#if animation_player.current_animation!=current_state:
			#animation_player.play(current_state)
		var next_state=get_node(current_state).check_exit_condition(parent)
		if next_state!=null:
			pop_state()
			push_state(next_state)

func push_state(state):
	if get_current_state() !=state:
		stack.push_front(state)

func pop_state():
	stack.pop_front()

func get_current_state():
	return stack[len(stack)-1] if len(stack)>0 else null

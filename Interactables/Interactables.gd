extends Area2D
class_name interactables

var player=null
var interactable=true

func _unhandled_key_input(event):
	if interactable:
		if event.is_action_pressed("Interact")&&player:
			do_interaction()
			interactable=false

func do_interaction():
	print("Hi")
	assert(false)
func _on_Interactables_body_entered(body):
	player=body


func _on_Interactables_body_exited(body):
	player=null

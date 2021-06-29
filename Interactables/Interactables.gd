extends Area2D
class_name interactables

var player=null

func _on_Interactables_body_entered(body):
	body.interactable=true
	player=body



func _on_Interactables_body_exited(body):
	player=null

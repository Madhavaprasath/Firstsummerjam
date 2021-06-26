extends "res://Actor/Actor.gd"

#actor should run walk slide Jump and some attack too later 

var direction

var Jumping=false
var short_jumping=false

func _ready():
	fsm.push_state("Idle")

func _unhandled_input(event):
	if is_on_floor():
		if event.is_action_pressed("ui_up"):
			Jumping=true
		elif event.is_action_released("ui_up")&&velocity.y<min_jump_velocity:
			 short_jumping=true


func move_actor(delta):
	var direction_dict={"left":Input.is_action_pressed("ui_left"),
				"right":Input.is_action_pressed("ui_right")}
	direction=int(direction_dict["right"])-int(direction_dict["left"])
	velocity.x=lerp(velocity.x,direction*speed,0.4)
	velocity=move_and_slide(velocity,Vector2.UP)

func jump():
	pass

func short_jum

func apply_gravity(delta):
	velocity.y+=gravity*delta

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
				jump()
		elif event.is_action_released("ui_up")&&velocity.y>min_jump_velocity:
				short_jump()
				cancel_fall_through()
		if event.is_action_pressed("ui_down"):
			fall_through()
func _physics_process(delta):
	apply_gravity(delta)


func move_actor(delta):
	direction=check_direction()
	velocity.x=lerp(velocity.x,direction*speed,0.4)
	velocity=move_and_slide(velocity,Vector2.UP)



func check_direction()->int:
	var direction_dict={"left":Input.is_action_pressed("ui_left"),
				"right":Input.is_action_pressed("ui_right")}
	return int(direction_dict["right"])-int(direction_dict["left"])

func apply_gravity(delta):
	velocity.y+=gravity*delta

func fall_through():
	if is_on_floor():
		set_collision_mask_bit(1,false)

func cancel_fall_through():
	if !get_collision_mask_bit(1):
		set_collision_mask_bit(1,true)


func jump():
	velocity.y=max_jump_velocity

func short_jump():
	velocity.y=min_jump_velocity


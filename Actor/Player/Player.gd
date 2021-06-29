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






func move_actor(delta,Idle=false):
	if !Idle:
		direction=check_direction()
		velocity.x=lerp(velocity.x,direction*speed,0.4)
	else:
		velocity.x=lerp(velocity.x,0,0.4)
	velocity=move_and_slide(velocity,Vector2.UP)


func check_direction()->int:
	var direction_dict={"left":Input.is_action_pressed("ui_left"),
				"right":Input.is_action_pressed("ui_right")}
	return int(direction_dict["right"])-int(direction_dict["left"])

func apply_gravity(delta):
	velocity.y+=gravity*delta

func can_fall_through():
	if is_on_floor():
		for index in get_slide_count():
			var collision=get_slide_collision(index)
			if collision.collider.is_in_group("Drop_thru"):
				if collision.normal.dot(get_floor_normal())==1:
					return true
	return false


func destroy_platform():
	for index in get_slide_count():
		var collision =get_slide_collision(index)
		if collision.collider.is_in_group("Destroyables"):
			var tile_position=collision.collider.world_to_map(position)
			tile_position-=collision.normal
			#take dot product
			var dot_product=Vector2(0,-1).dot(collision.normal)
			if abs(dot_product)==0:
				remove_tile(collision.collider,tile_position,true,[Vector2(0,-1),Vector2(0,0),Vector2(0,1)])
			elif dot_product==1:
				remove_tile(collision.collider,tile_position,true,[Vector2(-1,0),Vector2(0,0),Vector2(1,0)])


func remove_tile(collider,tile_position,destroy_surrounding_tiles=false,Array_of_adj_tiles=[]):
	if destroy_surrounding_tiles:
		var tile_position_array=[]
		for i in range(len(Array_of_adj_tiles)):
			tile_position_array.append(tile_position+Array_of_adj_tiles[i])
		for j in tile_position_array:
			collider.set_cellv(j,-1)
	
	else:
		collider.set_cellv(tile_position,-1)



func cancel_fall_through():
	if !get_collision_mask_bit(1):
		set_collision_mask_bit(1,true)


func jump():
	velocity.y=max_jump_velocity

func short_jump():
	velocity.y=min_jump_velocity





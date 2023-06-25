extends CharacterBody2D


const SPEED = 400.0
const FRICTION = 1000.0
const ACCELERATION = 1900.0


var input = Vector2.ZERO

func _physics_process(delta):
	player_motion(delta)
	
func get_input():
	input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	return input.normalized()

func player_motion(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (delta*FRICTION):
			velocity -= velocity.normalized() * (delta*FRICTION)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * ACCELERATION * delta)
		velocity = velocity.limit_length(SPEED)
	
	move_and_slide()
		
	

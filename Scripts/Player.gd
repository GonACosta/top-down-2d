extends CharacterBody2D


const SPEED = 300.0
const FRICTION = 600.0
const ACCELERATION = 1500.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func player_motion():
	var directionRL = Input.get_axis("ui_left", "ui_right")
	var directionUD = Input.get_axis("ui_up","ui_down")

	if directionRL:
		velocity.x = directionRL * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/(1/FRICTION))
	if directionUD:
		velocity.y = directionUD * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	return velocity

func _physics_process(delta):
	
	player_motion()

	move_and_slide()

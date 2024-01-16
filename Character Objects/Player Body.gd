extends CharacterBody2D


const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var movementDirection = Vector2.ZERO

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_left"):
		movementDirection.x = -1
	elif Input.is_action_pressed("ui_right"):
		movementDirection.x = 1
	else:
		movementDirection.x = 0
	
	if Input.is_action_pressed("ui_up"):
		movementDirection.y = -1
	elif Input.is_action_pressed("ui_down"):
		movementDirection.y = 1
	else:
		movementDirection.y = 0

	velocity = movementDirection * SPEED
	HandleAnimations()
	move_and_slide()

func HandleAnimations():
	$Body.flip_h = true if movementDirection.x > 0 else false
	
	if movementDirection.x != 0:
		$Visor.scale.x = movementDirection.x
	var walking = "Walk" if movementDirection != Vector2.ZERO else "Idle"
	
	if movementDirection.x > 0 or movementDirection.x < 0:
		$Body.play(walking+"Angled")
	else:
		$Body.play(walking+"Forward")
		

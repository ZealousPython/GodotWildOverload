extends CharacterBody2D



var chargeAmount = 0
var damage = 1
var pierce = 1
var speed = 100
var direction = Vector2.ZERO

func _physics_process(delta):
	damage = chargeAmount/50 + .5
	pierce = chargeAmount/50 + .5
	rotation += deg_to_rad(25)
	velocity = speed * direction
	
	move_and_slide()

extends CharacterBody2D


var chargeAmount = 0
var damage = 1
var pierce = 1
var speed = 100
var direction = Vector2.ZERO

func _physics_process(delta):
	scale.x = chargeAmount/100 + .5
	scale.y = chargeAmount/100 + .5
	damage = chargeAmount/50 + .5
	pierce = chargeAmount/50 + .5
	
	velocity = speed * (chargeAmount/50 + 1) * direction
	
	move_and_slide()

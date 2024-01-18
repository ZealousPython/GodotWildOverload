extends Sprite2D


var overloadAmount = 0
var overloadMax = 100
var chargeRate = 25
var attacking = false
var overloadCooldown = 60
var onCooldown = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	WeaponLogic(delta)
	if Input.is_action_pressed("Attack") and !onCooldown:
		attacking = true
		Attack()
		
	else:
		attacking = false
	
	if attacking:
		WhileAttacking(delta)
	else:
		ChargeDecay(delta)
	
	if overloadAmount >= 100:
		onCooldown = true
		OverloadAttack()
	if onCooldown and overloadAmount <= 0:
		onCooldown = false
	overloadAmount = clamp(overloadAmount,0,100)

func WeaponLogic(delta):
	pass

func _physics_process(delta):
	WeaponEffects()


func WhileAttacking(delta):
	overloadAmount += chargeRate * delta

func ChargeDecay(delta):
	overloadAmount -= chargeRate * delta

func WeaponEffects():
	offset.x = randi_range(-floor(overloadAmount/50),floor(overloadAmount/50))
	offset.y = randi_range(-floor(overloadAmount/50),floor(overloadAmount/50))
	ChargeLight()

func OverloadAttack():
	pass

func ChargeLight():
	$PointLight2D.energy = overloadAmount*16/320
func Attack():
	pass

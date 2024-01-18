extends Node2D


# Called when the node enters the scene tree for the first time.

var weaponOffset = Vector2(.5,0)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$WeaponHand.position = $"Player Body".position+weaponOffset

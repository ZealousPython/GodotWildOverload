extends "res://Character Objects/Weapons/BaseWeapon.gd"

var bullet = preload("res://Character Objects/Weapons/MachineGun/machine_gun_bullet.tscn")
var weaponBullet = preload("res://Character Objects/Weapons/MachineGun/thrown_weapon.tscn")
var shootCooldown = 0


func WeaponLogic(delta):
	shootCooldown -= 1 * delta
	if overloadAmount <= 0 and !visible:
		show()

func Attack():
	if shootCooldown <= 0:
		shoot()

func shoot():
	var projectile = bullet.instantiate()
	
	projectile.chargeAmount = overloadAmount
	projectile.direction = Vector2.from_angle(global_rotation+deg_to_rad(180))
	projectile.rotation = global_rotation+deg_to_rad(180)
	projectile.position = $Marker2D.global_position
	get_tree().get_root().add_child(projectile)
	
	shootCooldown = .2 / (overloadAmount/50 + 1)

func OverloadAttack():
	var projectile = weaponBullet.instantiate()
	
	projectile.chargeAmount = overloadAmount
	projectile.direction = Vector2.from_angle(global_rotation+deg_to_rad(180))
	projectile.rotation = global_rotation+deg_to_rad(180)
	projectile.position = $Marker2D.global_position
	get_tree().get_root().add_child(projectile)
	
	hide()

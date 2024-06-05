extends Node3D

@export var GunType : Gun

@onready var weapon_mesh : MeshInstance3D = $GunMesh
var totalgundamage = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	loadweapon()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func loadweapon():
	$GunMesh.mesh = GunType.mesh
	position = GunType.position
	rotation_degrees = GunType.rotation
	scale = GunType.scale
	totalgundamage = GunType.base_damage_poison + GunType.base_damage_lightning + GunType.base_damage_cold + GunType.base_damage_phys + GunType.base_damage_fire
	print(totalgundamage)

func _on_node_3d_usethisgun(NewGun):
	GunType = NewGun
	loadweapon()
	var owninghead = get_parent()
	var _owningplayer = owninghead.get_parent()

func shoot(raycast):
	print(raycast.get_collider())
	if raycast.is_colliding():
		var hittingthis = raycast.get_collider()
		if hittingthis.get_owner().has_method("takedamage"):
			hittingthis.get_owner().takedamage(GunType.base_damage_phys,GunType.base_damage_cold,GunType.base_damage_fire,
			GunType.base_damage_lightning,GunType.base_damage_poison)


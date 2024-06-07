extends Resource
class_name Weapon


enum Type {HEAD, CHEST, GLOVES, BOOTS, WEAPON, RING}

@export var Name: String
@export var type : Type
@export var InvIcon : Texture2D
@export_enum("Common","Magic","Rare","Legendary")
var rarity: String = "Common"
var rarity_dict = {50: "Common",25: "Magic",15: "Rare",10: "Legendary"}

@export_enum("Light","Sniper","Heavy")
var wpn_type: String = "Light"
var wpntype_dict = {1: "Light", 2: "Sniper", 3: "Heavy"}

@export_enum("SMG","AR","LMG","Sniper","Shotgun")
var gun_type: String = "SMG"
var guntype_dict = {1: "SMG", 2: "AR", 3: "LMG", 4: "Sniper", 5: "Shotgun"}

@export var suffixes = []
@export var prefixes = []
@export var maxsuffix = 0
@export var maxprefix = 0

@export var itemlevel = 1

@export var mesh : Mesh
@export var position : Vector3
@export var rotation : Vector3
@export var scale : Vector3

@export var base_damage_phys : float
@export var base_damage_cold : float
@export var base_damage_fire : float
@export var base_damage_lightning : float
@export var base_damage_poison : float
@export var ranged : bool

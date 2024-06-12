extends Node3D
@export var Weapons : Weapon
var  premadegun = load("res://Items/Gun.tres")
var trulyfairrng = RandomNumberGenerator.new()
var droplevel = 1
var gunsuffixes = ["Firey","Smoking","Shadowy"]
var gunmodels = [load("res://Items/Models/Guns/Vektor.obj"),load("res://Items/Models/Guns/Sniper.obj")]
var invicons = [load("res://Items/PlaceHolderImages/akifunny.png"), load("res://Items/PlaceHolderImages/andytag.png"), load("res://Items/PlaceHolderImages/image.png")]
signal usethisgun
# Called when the node enters the scene tree for the first time.
func _ready():
	var _this = ResourceLoader.load("res://Items/Gun.tres")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		ItemGeneration(1)
func ItemGeneration(itemlevel):
	print("lmao")
	var new_gun = Weapon.new()
	var itemrarity = trulyfairrng.randf_range(0.0,100)
	var gunsuffixesarray = gunsuffixes.duplicate()
	itemrarity = trulyfairrng.randf_range(0.0,100)
	if itemrarity > 50:
		new_gun.rarity = "Common"
	if itemrarity > 25 and itemrarity < 50:
		new_gun.rarity = "Magic"
	if itemrarity > 15 and itemrarity < 25:
		new_gun.rarity = "Rare"
	if itemrarity < 15:
		new_gun.rarity = "Legendary"
	var wpntype = trulyfairrng.randi_range(1,3)
	new_gun.wpn_type = new_gun.wpntype_dict[wpntype]
	var guntype = trulyfairrng.randi_range(1,5)
	new_gun.gun_type = new_gun.guntype_dict[guntype]
	if new_gun.rarity == "Common":
		new_gun.maxprefix = 0
		new_gun.maxsuffix = 0
	if new_gun.rarity == "Magic":
		new_gun.maxprefix = 1
		new_gun.maxsuffix = 1
	if new_gun.rarity == "Rare":
		new_gun.maxprefix = 3
		new_gun.maxsuffix = 3
	if new_gun.rarity != "Legendary":
		for i in new_gun.maxprefix:
			var suffixtouse = trulyfairrng.randi_range(0,gunsuffixesarray.size() - 1)
			new_gun.suffixes.append(gunsuffixesarray[suffixtouse])
			gunsuffixesarray.remove_at(suffixtouse)
	else:
		print("Wow Legendary")
	new_gun.itemlevel = itemlevel
	for i in new_gun.suffixes:
		var suffix_data = Affixes.affix_data[i].values()
		match suffix_data[2]:
			"Shadow":
				new_gun.base_damage_poison += suffix_data[4]
			"Fire":
				new_gun.base_damage_fire += suffix_data[4]
			"Lightning":
				new_gun.base_damage_lightning += suffix_data[4]
			"Ice":
				new_gun.base_damage_cold += suffix_data[4]
			"Physical":
				new_gun.base_damage_phys += suffix_data[4]
	new_gun.totaldamage = new_gun.base_damage_poison + new_gun.base_damage_lightning + new_gun.base_damage_cold + new_gun.base_damage_phys + new_gun.base_damage_fire
	print("Items suffixes are"," ",new_gun.suffixes)
	print(new_gun.itemlevel)
	new_gun.Name = "Doom Boom"
	var gunmeshpick = trulyfairrng.randi_range(0,1)
	new_gun.mesh = gunmodels[gunmeshpick]
	new_gun.scale = Vector3(0.5,0.5,0.5)
	new_gun.position = Vector3(.5,-1,-1)
	new_gun.rotation = Vector3(0,-90,0)
	new_gun.InvIcon = invicons[0]
	ResourceSaver.save(new_gun,"res://Items/Gun2.tres")
	print(new_gun)
	usethisgun.emit(new_gun)

func _on_the_tester_setitemlevel(itemlevel):
	ItemGeneration(itemlevel)

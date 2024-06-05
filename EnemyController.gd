extends Node3D
@export var EnemyResource : Enemy
var Health = 0.0
var physresist = 0.0
var coldresist = 0.0
var fireresist = 0.0
var lightningresist = 0.0
var poisonresist = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	Health = EnemyResource.Health
	physresist = EnemyResource.PhysResist
	coldresist = EnemyResource.ColdResist
	fireresist = EnemyResource.FireResist
	lightningresist = EnemyResource.LightningResist
	poisonresist = EnemyResource.PoisonResist


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takedamage(phys,cold,fire,lightning,poison):
	var physdmgtotake = phys * (1.0 - (physresist / 100))
	var colddmgtotake = cold * (1.0 - (coldresist / 100))
	var firedmgtotake = fire * (1.0 - (fireresist / 100))
	var lightningdmgtotake = lightning * (1.0 - (lightningresist / 100))
	var poisondmgtotake = poison * (1.0 - (poisonresist / 100))
	var dmgtotake = (physdmgtotake + colddmgtotake + firedmgtotake + lightningdmgtotake + poisondmgtotake)
	Health -= (dmgtotake)
	print(dmgtotake)
	print(Health)
	if Health <= 0:
		print("Im dead as hell")

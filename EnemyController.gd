extends Node3D
@export var EnemyResource : Enemy
var Health = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Health = EnemyResource.Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takedamage(phys,cold):
	print(phys,"+",cold)
	var physdmgtotake = phys
	Health -= cold
	print(Health)
	if Health <= 0:
		print("Im dead as hell")

extends Node3D
signal setitemlevel(itemlevel)
var genlevel = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("use"):
		setitemlevel.emit(genlevel)
	if Input.is_action_just_pressed("inclevel"):
		genlevel += 1
		print(genlevel)

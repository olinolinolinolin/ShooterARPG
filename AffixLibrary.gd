extends Node

var affix_pool: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	affix_pool  = [
		Affix.new()
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

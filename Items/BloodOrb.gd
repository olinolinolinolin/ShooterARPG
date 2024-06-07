extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		pass


func _on_character_health_changed(_change):
	$".".mesh.material.set_shader_parameter("blood_level", .5 )

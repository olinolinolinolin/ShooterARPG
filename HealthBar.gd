extends Control

@onready var health_bar = $HealthProgressBar
@onready var healthlabel = $HealthProgressBar/Healthlabel
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	health_bar.value = health
	healthlabel.text = "lmao health"


func _on_character_health_changed(newhealth):
	health = newhealth

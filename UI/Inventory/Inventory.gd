extends CanvasLayer
signal updateplayerslots



@export var InvSize = 20
var itemsLoad = [ "res://Items/Gun.tres" , "res://Items/Gun2.tres"
	
]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(Weapon.Type.WEAPON, Vector2(128,64))
		%Inv.add_child(slot)

	for i in itemsLoad.size():
		var item := InventoryItem.new()
		item.init(load(itemsLoad[i]))
		%Inv.get_child(i).add_child(item)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		self.visible = !self.visible
		if Input.mouse_mode == 0:
			Input.mouse_mode = 2
		else:
			Input.mouse_mode = 0 


func reloaditems():
	for i in itemsLoad.size():
		var item := InventoryItem.new()
		item.init(load(itemsLoad[i]))
		%Inv.get_child(i).add_child(item)


func _on_weapon_slot_1_change_weapon_slot(data, slot):
	updateplayerslots.emit(data, slot)


func _on_weapon_slot_2_change_weapon_slot(data, slot):
	updateplayerslots.emit(data, slot)


func _on_weapon_slot_3_change_weapon_slot(data, slot):
	updateplayerslots.emit(data, slot)


func _on_weapon_slot_4_change_weapon_slot(data, slot):
	updateplayerslots.emit(data, slot)

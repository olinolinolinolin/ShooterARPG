class_name InventorySlot
extends PanelContainer
signal ChangeWeaponSlot

@export var type: Weapon.Type
@export var Slot : int

func init(t: Weapon.Type, cms: Vector2) -> void:
	type = t
	custom_minimum_size = cms

func _can_drop_data(_at_position: Vector2, data: Variant):
	if data is InventoryItem:
		if type == Weapon.Type.WEAPON:
			if get_child_count() == 0:
				return true
			else:
				if type == data.get_parent().type:
					return true
			return get_child(0).data.type == data.data.type
		else:
			return data.data.type == type
	return false
func _drop_data(_at_position: Vector2, data: Variant):
	if get_child_count() > 0:
		var item := get_child(0)
		if item == data:
			return 
		item.reparent(data.get_parent())
	data.reparent(self)
	ChangeWeaponSlot.emit(data.data, Slot)
	print(data.data)

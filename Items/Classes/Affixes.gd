extends Node

var affix_data


func _ready():
	var affixdata_file = FileAccess.open("res://Data/affixdata.json", FileAccess.READ)
	var affixdata_json = JSON.parse_string(affixdata_file.get_as_text())
	affix_data = affixdata_json
	print(affix_data)

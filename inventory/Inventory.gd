extends Node
class_name Inventory

var item
onready var spawn_point = get_parent().get_node("SpawnPoint")

func get_item():
	return item

func has(_item):
	if item != null:
		if item.item_name == _item:
			return true
		else:
			return false

func add(reference):
	item = reference

func drop():
	if item != null:
		add_child(item)
		item.global_position = spawn_point.global_position
		item = null
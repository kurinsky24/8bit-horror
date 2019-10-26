extends Node
class_name Inventory

onready var spawn_point = get_parent().get_node("SpawnPoint")

func get_item():
	if get_child_count() >0:
		return get_child(0)
	else: return null

func has(item):
	if get_item().item == item:
		return true
	else:
		false

func add(reference):
	var item = get_item()
	if not item:
		add_child(reference.duplicate())
		get_item().set_monitorable(false)
		get_item().hide()

func drop():
	var item = get_item()
	item.show()
	item.set_monitorable(true)
	item.global_position = spawn_point.global_position
	var drop_item = get_tree().get_root().add_child(item.duplicate())
	remove()


func remove():
	get_item().queue_free()
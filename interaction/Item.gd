extends Area2D
class_name Item

export var item_name : String

func _on_Item_body_entered(body):
	if body is Player:
#		body.inventory.add(duplicate())
		body.interaction = self

func remove():
	queue_free()
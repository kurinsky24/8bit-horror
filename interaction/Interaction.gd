extends Area2D

export var condition_item : PackedScene

func _on_Interaction_body_entered(body):
	if body is Player:
		if body.inventory.has(condition_item.instance().item_name):
			print("open")
		else:
			print("closed")

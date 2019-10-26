extends Area2D

export var item : Resource

func _on_InteractableArea_body_entered(body):
	if body is Player:
		if body.inventory.has(item):
			print("open")
		else:
			print("its locked")

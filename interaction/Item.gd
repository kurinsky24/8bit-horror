extends Area2D
class_name Item

export var item : Resource

func remove():
	queue_free()

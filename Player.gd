extends KinematicBody2D
class_name Player

export var speed : float = 20
var interaction
onready var inventory = $Inventory
onready var anim = $AnimationPlayer

func _physics_process(delta):
	control()
	var dir = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()
	if dir.x > 0:
		$Body.flip_h = true
	elif dir.x < 0:
		$Body.flip_h = false
		
	if dir.length() > 0:
		anim.play("move")
	else: anim.stop()
	move_and_slide(dir * speed)

func control():	
	if Input.is_action_just_pressed("action"):
		if interaction != null:
			if inventory.get_item() != null:
				inventory.drop()
			else:
				inventory.add(interaction)
				interaction.remove()
				interaction = null
		else:
			if inventory.get_item() != null:
				inventory.drop()


func _on_DetectInteraction_area_entered(area):
	if area is Item:
		interaction = area

func _on_DetectInteraction_area_exited(area):
	interaction = null

extends CharacterBody2D
const  SPEED = 20
var array:Array = []
var diaRange:float = 300
func _physics_process(delta):
	print(array)
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED
	elif Input.is_action_pressed("ui_left"):
		position.x -= SPEED
	elif Input.is_action_pressed("ui_up"):
		position.y -= SPEED
	elif Input.is_action_pressed("ui_down"):
		position.y += SPEED
			
		
	
					
					
func _process(delta):
		if get_parent().get_children().size() > 0:
				for i in get_parent().get_children():
					if "NPC" in i.name:
						if self.position.distance_to(i.position) <= diaRange:
								if i not in array:
									array.append(i)
									print("entered")
						else:
							i.canInteract = false
							if i in array:
								
								print("exited")
								array.erase(i)
						if array.size() >0:
							if is_instance_valid(array[0]):
								array[0].canInteract = true
								if Input.is_action_just_pressed("ui_accept"):
									array[0].showDialogue()

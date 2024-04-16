extends CharacterBody2D
var canInteract:bool = false
var dialogueDict:Dictionary = {
	0:"Hi!",
	1:"Hello",
	2:"Dialogue Finished"
}
@onready var dialogue = get_parent().get_node("Dialogue")
var dialogueIndex:int = 0
func showDialogue():
	if canInteract:
		print("Dialogue shown")
		dialogue.visible = true
		dialogue.get_node("Label").text = dialogueDict[dialogueIndex]
		if Input.is_action_just_pressed("ui_accept") and dialogueIndex < dialogueDict.size() - 1:
			dialogueIndex +=1
		elif dialogueIndex == dialogueDict.size() - 1:
			canInteract = false
func _process(delta):
	if not canInteract:
		dialogue.visible = false
		dialogueIndex = 0

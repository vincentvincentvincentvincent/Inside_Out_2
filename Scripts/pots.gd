extends Area2D

@export var Pot_id:int = 0
@export var Enter_Amount: int = 3
var Enters: int= 0
@export var Completed: bool = false	

func _on_body_entered(_body: Node2D) -> void: #counter
	if Enters < Enter_Amount:
		Enters += 1
	if Enters >= Enter_Amount:
		Completed = true

func display(): #updates text 
	$Label.text = str(Enters) + "/" + str(Enter_Amount)

func _process(_delta: float) -> void:
	display()
	

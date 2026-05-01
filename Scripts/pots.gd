extends Area2D

@export var Pot_id:int = 0
@export var Enter_Amount: int = 3
var Enters: int= 0
@export var Completed: bool = false	
@export var Checkpoint_pos_X = 0
@export var Checkpoint_pos_y = 0

func _on_body_entered(_body: Node2D) -> void: #counter
	if Enters < Enter_Amount:
		Enters += 1
	if Enters >= Enter_Amount:
		Completed = true
		Global.Start_pos_X = Checkpoint_pos_X
		Global.Start_pos_Y = Checkpoint_pos_y

func display(): #updates text 
	$Label.text = str(Enters) + "/" + str(Enter_Amount)

func _process(_delta: float) -> void:
	display()
	if Enters == 0:
		$AnimatedSprite2D.animation = "default"
	if Enters == 1:
		$AnimatedSprite2D.animation = "blood 1"
	if Enters == 2:
		$AnimatedSprite2D.animation = "blood 2"
	if Enters == 3:
		$AnimatedSprite2D.animation = "blood 3"

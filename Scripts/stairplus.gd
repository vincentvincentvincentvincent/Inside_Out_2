extends "res://Scripts/stair.gd"

func _process(_delta: float) -> void:
	wall0()

func wall0(): #destroys wall 0 when pot 0 is full 
	var walls: Array = [Vector2i(126,130), Vector2i(127,130)
	]
	if $"Entities/Pot Control/Pots".Completed == true:
		for i in walls:
			$Level/Solid.erase_cell(i) 

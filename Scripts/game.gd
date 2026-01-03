extends Node2D



func _on_area_2d_body_entered(_body: Node2D) -> void: #win con
	call_deferred("change_scene")

func change_scene():  #win con
	get_tree().change_scene_to_file("res://Scenes/Titles/score.tscn")

func breaking(): #for player to bloddy a tile
	var tilemaplayer = $Level/Default
	var tile_pos = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/Feet.global_position))
	var tile_dat = tilemaplayer.get_cell_tile_data(tile_pos)

	if tile_dat:
		if tile_dat.get_custom_data("Breakable"):
			tilemaplayer.erase_cell(tile_pos)

func wall0(): #destroys wall 0 when pot 0 is full 18,7 - 18,14
	var walls: Array = [Vector2i(18,7), Vector2i(18,8), Vector2i(18,9), Vector2i(18,10), Vector2i(18,11), Vector2i(18,12), Vector2i(18,13), Vector2i(18,14) ]
	if $Entities/Pots.Completed == true:
		for i in walls:
			$Level/Default.erase_cell(i) 
		
func _process(_delta: float) -> void:
	breaking()
	wall0()

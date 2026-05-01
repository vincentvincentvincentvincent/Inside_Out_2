extends Node2D




var splatter_Scene: PackedScene =preload("res://Scenes/Entities/splatter.tscn")
var follow : bool = true
@export var random_str:float = 2.3
@export var shakefade:float = 5.0
var rng  = RandomNumberGenerator.new()
var shake_str:float = 0.0

func _ready() -> void:
	Global.Start_pos_X = 1338.0
	Global.Start_pos_Y = 1642.0
	
	var energy_world = create_tween()
	energy_world.set_loops(0)
	energy_world.tween_property($World/DirectionalLight2D, "energy", 3, 3)
	energy_world.tween_property($World/DirectionalLight2D, "energy", 2.4, 3)
	
func look_pupil(): #moves the pupil of the eye not working for now
	$Entities/Pupil.look_at($Entities/Player/Feet.global_position)

func shake():
	shake_str = random_str

func randomoffset():
	return Vector2(rng.randf_range(-shake_str, shake_str),rng.randf_range(-shake_str, shake_str))

func cam_Control(): # Sets follow
	if follow == true:
		$Camera2D.position = $Entities/Player.position


func change_scene():  #win con
	get_tree().change_scene_to_file("res://Scenes/Titles/score.tscn")
	

func breaking(): #for player to bloddy a tile. VERY VERY badly coded
	
	
	var tilemaplayer = $Level/Default
	var tile_posMB = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/MB.global_position))
	var tile_posMB2 = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/MB2.global_position))
	var tile_posLM = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/LM.global_position))
	var tile_posLB = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/LB.global_position))
	var tile_posLB2 = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/LB2.global_position))
	var tile_posLT = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/LT.global_position))
	var tile_posLT2 = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/LT2.global_position))
	var tile_posMT = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/MT.global_position))
	var tile_posMT2 = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/MT2.global_position))
	var tile_posRT = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/RT.global_position))
	var tile_posRT2 = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/RT2.global_position))
	var tile_posRM = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/RM.global_position))
	var tile_posRB = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/RB.global_position))
	var tile_posRB2 = tilemaplayer.local_to_map(tilemaplayer.to_local($Entities/Player/RB2.global_position))
	var tile_datMB = tilemaplayer.get_cell_tile_data(tile_posMB)
	var tile_datMB2 = tilemaplayer.get_cell_tile_data(tile_posMB2)
	var tile_datLM = tilemaplayer.get_cell_tile_data(tile_posLM)
	var tile_datLB = tilemaplayer.get_cell_tile_data(tile_posLB)
	var tile_datLB2 = tilemaplayer.get_cell_tile_data(tile_posLB2)
	var tile_datLT = tilemaplayer.get_cell_tile_data(tile_posLT)
	var tile_datLT2 = tilemaplayer.get_cell_tile_data(tile_posLT2)
	var tile_datMT = tilemaplayer.get_cell_tile_data(tile_posMT)
	var tile_datMT2 = tilemaplayer.get_cell_tile_data(tile_posMT2)
	var tile_datRT = tilemaplayer.get_cell_tile_data(tile_posRT)
	var tile_datRT2 = tilemaplayer.get_cell_tile_data(tile_posRT2)
	var tile_datRM = tilemaplayer.get_cell_tile_data(tile_posRM)
	var tile_datRB = tilemaplayer.get_cell_tile_data(tile_posRB)
	var tile_datRB2 = tilemaplayer.get_cell_tile_data(tile_posRB2)

	if tile_datMB:
		if tile_datMB.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posMB)

	if tile_datMB2:
		if tile_datMB2.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posMB2)

	if tile_datLM:
		if tile_datLM.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posLM)

	if tile_datLB:
		if tile_datLB.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posLB)

	if tile_datLB2:
		if tile_datLB2.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posLB2)

	if tile_datLT:
		if tile_datLT.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posLT)

	if tile_datLT2:
		if tile_datLT2.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posLT2)

	if tile_datMT:
		if tile_datMT.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posMT)

	if tile_datMT2:
		if tile_datMT2.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posMT2)
			
	if tile_datRT:
		if tile_datRT.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posRT)

	if tile_datRT2:
		if tile_datRT2.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posRT2)

	if tile_datRM:
		if tile_datRM.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posRM)

	if tile_datRB:
		if tile_datRB.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posRB)

	if tile_datRB2:
		if tile_datRB2.get_custom_data("Breakable"):
			await get_tree().create_timer(1).timeout
			tilemaplayer.erase_cell(tile_posRB2)


func death(): #Resets the position of the player
	Global.player_health -= 1
	shake()
	var red = create_tween()
	red.tween_property($World/CanvasModulate, "color", Color(1, 0, 0), 0.4)
	red.tween_property($World/CanvasModulate, "color", Color(0, 0, 0), 1)
	if Global.player_health <= 0:
		$Entities/Player.position.x = Global.Start_pos_X
		$Entities/Player.position.y = Global.Start_pos_Y
		Global.player_health = 6
		Global.death_count += 1
func _on_death_body_entered(body: Node2D) -> void:
	var splat = splatter_Scene.instantiate() as CPUParticles2D
	splat.position = $Entities/Player.position 
	$Entities.add_child(splat)
	if body.name.match('Default'): 
		death()
	if body.name.match("Bloodied"):
		Global.speed = 60
		await get_tree().create_timer(1).timeout
		Global.speed = 40

func _process(delta: float) -> void:
	breaking()
	cam_Control()
	wall0()
	


	if shake_str > 0:
		shake_str  = lerpf(shake_str,0, shakefade * delta)
		$Camera2D.offset = randomoffset()





func _on_goal_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene") 
	
	
func wall0(): #destroys wall 0 when pot 0 is full 
	var walls: Array = [Vector2i(142, 65), Vector2i(142, 66), Vector2i(142, 67), Vector2i(142, 68), Vector2i(142, 69), Vector2i(142, 70), Vector2i(142, 71), 
	Vector2i(142, 72), Vector2i(142, 73), Vector2i(142, 74), Vector2i(142, 75), Vector2i(142, 76), Vector2i(142, 77), 
	]
	if $"Entities/Pot Control/Pots".Completed == true:
		for i in walls:
			$Level/solid.erase_cell(i) 

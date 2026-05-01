extends Node2D

var splatter_Scene: PackedScene =preload("res://Scenes/Entities/splatter.tscn")
var follow : bool = true
@export var random_str:float = 2.3
@export var shakefade:float = 5.0
var rng  = RandomNumberGenerator.new()
var shake_str:float = 0.0

func _ready() -> void:
	var energy_world = create_tween()
	energy_world.set_loops(0)
	energy_world.tween_property($world/DirectionalLight2D, "energy", 3, 3)
	energy_world.tween_property($world/DirectionalLight2D, "energy", 2.4, 3)
	
	Global.Start_pos_X = 1338.0
	Global.Start_pos_Y = 1642.0

func look_pupil(): #moves the pupil of the eye not working for now
	$Entities/Pupil.look_at($Entities/Player/Feet.global_position)

func shake():
	shake_str = random_str

func randomoffset():
	return Vector2(rng.randf_range(-shake_str, shake_str),rng.randf_range(-shake_str, shake_str))

func cam_Control(): # Sets follow
	if follow == true:
		$Camera2D.position = $Entities/Player.position
func _on_start__in_area_entered(area: Node2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(1.6,1.6), 2)
		follow = true
func _on_upwards__out_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(0.9,0.9), 5)
		var move = create_tween()
		move.tween_property($Camera2D, "position", Vector2(3000,1800), 3)
		follow = false
func _on_upwarder__move_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(0.9,0.9), 3)
		var move = create_tween()
		move.tween_property($Camera2D, "position", Vector2(2500,1370), 1.7)
		follow = false
func _on_casm__out_2_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(0.6,0.6), 5)
		follow = true
func _on_top__in_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(1.5,1.5), 2)
		follow = true
func _on_final_stretch_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(1.2,1.2), 3)
		var move = create_tween()
		move.tween_property($Camera2D, "position", Vector2(6000,1000), 3)
		follow = false
func _on_the_shoot__in_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		follow = true
		await get_tree().create_timer(1).timeout
		var zoom = create_tween()
		zoom.tween_property($Camera2D, "zoom", Vector2(2,2), 5)
		$Camera2D.zoom.x = 2
		$Camera2D.zoom.y = 2
func _on_end_area_entered(area: Area2D) -> void:
	if area.name.match("Death"):
		var zoom = create_tween()
		follow = false
		zoom.tween_property($Camera2D, "zoom", Vector2(0.7,0.7), 5)
		await get_tree().create_timer(1).timeout
		var move = create_tween()
		move.tween_property($Camera2D, "position", Vector2(7250,3000), 3)

func _on_area_2d_body_entered(_body: Node2D) -> void: #win con
	call_deferred("change_scene") 

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
	red.tween_property($world/CanvasModulate, "color", Color(1, 0, 0), 0.4)
	red.tween_property($world/CanvasModulate, "color", Color(0, 0, 0), 1)
	if Global.player_health <= 0:
		$Entities/Player.position.x = Global.Start_pos_X
		$Entities/Player.position.y = Global.Start_pos_Y
		Global.player_health = 6
		Global.death_count += 1

func _on_death_body_entered(body: Node2D) -> void: #Misleading name kinda, Does damage to the player or adds a little boost depending on what they hit.
	var splat = splatter_Scene.instantiate() as CPUParticles2D
	splat.position = $Entities/Player.position 
	$Entities.add_child(splat)
	if body.name.match('Default'): 
		death()
	if body.name.match("Bloodied"):
		Global.speed = 60
		await get_tree().create_timer(1).timeout
		Global.speed = 40

func wall0(): #destroys wall 0 when pot 0 is full 
	var walls: Array = [Vector2i(179,126), Vector2i(179,127), Vector2i(179,128), Vector2i(179,129), Vector2i(179,130), Vector2i(179,131), Vector2i(179,132), Vector2i(179,133), 
	Vector2i(179,134), Vector2i(180,126), Vector2i(180,127), Vector2i(180,128), Vector2i(180,129), Vector2i(180,130), Vector2i(180,131), Vector2i(180,132), Vector2i(180,133), Vector2i(180,134),
	Vector2i(181,126), Vector2i(181,127), Vector2i(181,128), Vector2i(181,129), Vector2i(181,130), Vector2i(181,131), Vector2i(181,132), Vector2i(181,133), Vector2i(181,134) 
	]
	if $"Entities/Pot Control/Pots".Completed == true:
		for i in walls:
			$Level/Solid.erase_cell(i) 

func wall1(): #destroys wall 1 when pot 1 is full 
	var walls1: Array = [Vector2i(216,61), Vector2i(216,62), Vector2i(216,63), Vector2i(216,64), Vector2i(216,65), Vector2i(216,66), Vector2i(216,67), Vector2i(216,68), Vector2i(216,69), 
	Vector2i(216,70), Vector2i(216,71), Vector2i(216,72), Vector2i(216,73), Vector2i(217,61), Vector2i(217,62), Vector2i(217,63), Vector2i(217,64), Vector2i(217,65), Vector2i(217,66), 
	Vector2i(217,67), Vector2i(217,68), Vector2i(217,69), Vector2i(217,70), Vector2i(217,71), Vector2i(217,72), Vector2i(217,73),Vector2i(218,61), Vector2i(218,62), Vector2i(218,63),
	 Vector2i(218,64), Vector2i(218,65), Vector2i(218,66), Vector2i(218,67), Vector2i(218,68), Vector2i(218,69), Vector2i(218,70), Vector2i(218,71), Vector2i(218,72), Vector2i(218,73),
	]
	if $"Entities/Pot Control/Pots2".Completed == true:
		for i in walls1:
			$Level/Solid.erase_cell(i) 

func wall2(): #destroys wall 2 when pot 2 is full 
	var walls2: Array = [Vector2i(389,64), Vector2i(390,64), Vector2i(391,64),Vector2i(392,64), Vector2i(393,64), Vector2i(394,64), Vector2i(395,64), Vector2i(389,65), Vector2i(390,65), 
	Vector2i(391,65),Vector2i(392,65), Vector2i(393,65), Vector2i(394,65), Vector2i(395,65), Vector2i(389,66), Vector2i(390,66), Vector2i(391,66),Vector2i(392,66), Vector2i(393,66), 
	Vector2i(394,66), Vector2i(395,66), 
	]
	if $"Entities/Pot Control/Pots3".Completed == true:
		for i in walls2:
			$Level/Solid.erase_cell(i) 
func _process(delta: float) -> void:
	wall0()
	wall1()
	wall2()
	breaking()
	cam_Control()

	if shake_str > 0:
		shake_str  = lerpf(shake_str,0, shakefade * delta)
		$Camera2D.offset = randomoffset()

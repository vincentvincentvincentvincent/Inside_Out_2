extends Node2D

var speed:int = 40
var death_count:int = 0
var player_health:int = 6
var Start_pos_X = 1338.0
var Start_pos_Y = 1642.0
@export var grav = 100

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Return_Menu"):
		get_tree().change_scene_to_file("res://Scenes/Titles/menu.tscn")

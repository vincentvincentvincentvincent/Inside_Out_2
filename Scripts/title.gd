extends Node2D

func check_input():
	if (Input.is_anything_pressed() ):
		call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/Titles/animation.tscn")

func _process(_delta: float) -> void:
	check_input()

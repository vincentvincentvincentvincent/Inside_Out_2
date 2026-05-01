extends Node2D




func _on_stair_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/stair.tscn")


func _on_inside_out_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/game.tscn")



func _on_pyramid_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/pyramid.tscn")


func _on_leroy_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/Leroy.tscn")


func _on_tde_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/TDE.tscn")


func _on_caves_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/Caves.tscn")

func _on_caves_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/caves2.tscn")


func _on_funne_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/Funnel.tscn")


func _on_bannana_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/Bannana.tscn")

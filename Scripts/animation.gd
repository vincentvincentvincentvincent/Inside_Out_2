extends Node2D

var timer_adjust := 5

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/Titles/menu.tscn")
	
func _on_timer_timeout() -> void:
	change_scene()
	
func _physics_process(_delta: float) -> void:
	$Timer.wait_time = timer_adjust

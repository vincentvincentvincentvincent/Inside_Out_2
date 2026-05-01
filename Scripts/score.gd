extends Node2D

func _process(_delta: float) -> void:
	$Control/Label.text = str(Global.death_count)

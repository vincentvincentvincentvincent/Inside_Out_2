extends StaticBody2D

func look_pupil():
	$pupil.look_at($Entities/Player.global_position)

func _physics_process(_delta: float) -> void:
	look_pupil()

extends CharacterBody2D

var direction= Vector2.LEFT
@export var speed:int = 100
@export var seconds:int = 2 #in seconds


func movementcontrol(): #moves saw from start to finsish
		direction  = Vector2.LEFT
		await get_tree().create_timer(2).timeout
		direction  = Vector2.RIGHT
		await get_tree().create_timer(2).timeout

func _process(delta: float) -> void:
	movementcontrol()
	position += direction * speed * delta

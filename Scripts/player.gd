extends CharacterBody2D

var direction_x : float
@export var jump_str = 140

func get_input(): #moves horizontally
	direction_x = Input.get_axis("left", "right")

func bounce(): #bounce
	if is_on_floor(): 
		velocity.y = -jump_str
	
func apply_gravity(delta): #gravity
	velocity.y += Global.grav * delta 
	

func _physics_process(delta: float) -> void:
	get_input()
	bounce()
	velocity.x = direction_x * Global.speed  
	apply_gravity(delta)
	move_and_slide()

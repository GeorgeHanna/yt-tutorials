class_name Player
extends CharacterBody2D

@export var WALK_SPEED = 150
@export var JUMP_VELOCITY = -450.0


var gravity: int = 980
	
		
func _physics_process(delta: float) -> void:	
	velocity.y = velocity.y + gravity * delta
	velocity.x = WALK_SPEED

	move_and_slide()

func _input(event: InputEvent) -> void:
	if is_on_floor():
		if event.is_action_pressed("jump"):
			velocity.y = JUMP_VELOCITY

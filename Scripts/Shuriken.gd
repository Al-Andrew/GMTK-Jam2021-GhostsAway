extends KinematicBody2D

export var speed: Vector2
export var destroy_on_colision: bool
export var rotation_speed: float

func die() -> void:
	if destroy_on_colision :
			queue_free()


func _ready():
	pass 

func _physics_process(_delta):
	
	rotate(rotation_speed)
	
	var colision := move_and_collide(speed)
	if colision != null :
		var body := colision.collider
		if body.is_in_group("Player"):
			body.die()
		
		die()

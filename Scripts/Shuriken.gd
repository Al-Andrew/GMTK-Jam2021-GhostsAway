extends KinematicBody2D

export var speed: Vector2
export var destroy_on_colision: bool
export var rotation_speed: float

func _ready():
	pass 


func _physics_process(delta):
	
	rotate(rotation_speed)
	
	var colision := move_and_collide(speed)
	if colision != null :
		var body := colision.collider
		if body.is_in_group("Player") :
			body.die()
		
		
		
		if destroy_on_colision :
			queue_free()

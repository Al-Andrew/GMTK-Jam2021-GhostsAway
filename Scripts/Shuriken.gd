extends Area2D

export var speed: Vector2
export var destroy_on_colision: bool
export var rotation_speed: float

func _ready():
	pass 


func _physics_process(delta):
	
	rotate(rotation_speed)
	
	position += speed*delta


func _on_Shuriken_body_entered(body):
	if destroy_on_colision :
		queue_free()
	body.queue_free()


func _on_Shuriken_area_shape_entered(area_id, area, area_shape, local_shape):
	if area.get_parent().is_in_group("Player") :
		area.get_parent().die()

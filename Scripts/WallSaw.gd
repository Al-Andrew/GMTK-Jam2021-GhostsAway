extends StaticBody2D

export var break_saw_on_colision: bool

func _ready() -> void:
	$Shuriken.destroy_on_colision = break_saw_on_colision
	pass 



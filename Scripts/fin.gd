extends Node2D

export var next_scene: PackedScene

func _ready():
	$Control/Label2.text = $Control/Label2.text % Global.total_time 
	$Control/AnimationPlayer.play("appear")
	yield(get_tree().create_timer(4.0), "timeout")
	Global.total_time = 0
	Global.level_time = 0
	get_tree().change_scene("res://Scenes/Menu.tscn")
